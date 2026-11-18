---
name: image-optimization
description: "Optimize images for web performance — format selection (AVIF, WebP), responsive sizing, lazy loading, CDNs, and Core Web Vitals LCP optimization."
license: MIT
---

Images account for 50%+ of page weight on most sites. Optimizing
them is the highest-impact performance improvement you can make.

## Format decision tree

```
Does the browser support AVIF?
├── Yes → Use AVIF (best compression, ~50% smaller than JPEG)
└── No → Does the browser support WebP?
    ├── Yes → Use WebP (~30% smaller than JPEG)
    └── No → Use JPEG (with progressive encoding)
```

## HTML picture element

```html
<picture>
  <!-- AVIF for modern browsers -->
  <source
    type="image/avif"
    srcset="hero-400.avif 400w, hero-800.avif 800w, hero-1200.avif 1200w"
    sizes="(min-width: 768px) 50vw, 100vw"
  />

  <!-- WebP fallback -->
  <source
    type="image/webp"
    srcset="hero-400.webp 400w, hero-800.webp 800w, hero-1200.webp 1200w"
    sizes="(min-width: 768px) 50vw, 100vw"
  />

  <!-- JPEG final fallback -->
  <img
    src="hero-800.jpg"
    srcset="hero-400.jpg 400w, hero-800.jpg 800w, hero-1200.jpg 1200w"
    sizes="(min-width: 768px) 50vw, 100vw"
    alt="Hero image description"
    width="800"
    height="400"
    loading="lazy"
    decoding="async"
    fetchpriority="low"
  />
</picture>
```

## LCP optimization

```html
<!-- Hero image: load eagerly, high priority -->
<img
  src="hero.avif"
  alt="Hero description"
  width="1200"
  height="600"
  fetchpriority="high"
  decoding="async"
/>

<!-- Above the fold: load eagerly, normal priority -->
<img
  src="product.avif"
  alt="Product description"
  width="600"
  height="400"
  loading="eager"
  decoding="async"
/>

<!-- Below the fold: lazy load -->
<img
  src="footer-image.avif"
  alt="Footer description"
  width="600"
  height="400"
  loading="lazy"
  decoding="async"
/>
```

## Node.js image processing

```typescript
import sharp from 'sharp';

interface ImageOptions {
  width: number;
  quality?: number;
  format?: 'avif' | 'webp' | 'jpeg' | 'png';
}

async function optimizeImage(
  input: Buffer,
  options: ImageOptions
): Promise<Buffer> {
  const { width, quality = 80, format = 'webp' } = options;

  return sharp(input)
    .resize(width, null, {
      withoutEnlargement: true,
      fit: 'inside',
    })
    .toFormat(format, { quality })
    .toBuffer();
}

// Generate responsive variants
async function generateResponsiveSet(input: Buffer, name: string) {
  const sizes = [400, 800, 1200, 1600];
  const formats: Array<'avif' | 'webp'> = ['avif', 'webp'];

  for (const format of formats) {
    for (const width of sizes) {
      const optimized = await optimizeImage(input, { width, format });
      await writePublic(`/${name}-${width}.${format}`, optimized);
    }
  }

  // Also generate JPEG fallback
  const jpeg = await optimizeImage(input, { width: 800, format: 'jpeg', quality: 85 });
  await writePublic(`/${name}-800.jpg`, jpeg);
}
```

## Lazy loading with Intersection Observer

```typescript
function lazyLoadImages() {
  const images = document.querySelectorAll('img[data-src]');

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const img = entry.target as HTMLImageElement;
          img.src = img.dataset.src!;
          img.removeAttribute('data-src');
          observer.unobserve(img);
        }
      });
    },
    { rootMargin: '200px' } // Start loading 200px before visible
  );

  images.forEach((img) => observer.observe(img));
}
```

## Image CDN patterns

```typescript
// imgproxy / Cloudflare Images / Cloudinary URL generation
function imageUrl(src: string, options: {
  width?: number;
  format?: string;
  quality?: number;
}): string {
  const params = new URLSearchParams();
  if (options.width) params.set('w', String(options.width));
  if (options.format) params.set('f', options.format);
  if (options.quality) params.set('q', String(options.quality));

  return `https://images.yourapp.com/${encodeURIComponent(src)}?${params}`;
}
```

## Performance checklist

```markdown
## Formats
- [ ] Use AVIF for supported browsers (Chrome 85+, Firefox 93+)
- [ ] Use WebP as fallback (97%+ browser support)
- [ ] Use JPEG for final fallback
- [ ] Compress JPEGs to quality 80-85

## Sizing
- [ ] Generate 3-4 responsive variants (400w, 800w, 1200w, 1600w)
- [ ] Set explicit width and height attributes (prevent CLS)
- [ ] Use sizes attribute to match layout width

## Loading
- [ ] Lazy load below-the-fold images (loading="lazy")
- [ ] Eager load hero/LCP images (fetchpriority="high")
- [ ] Use decoding="async" for non-critical images

## Delivery
- [ ] Serve via CDN with edge caching
- [ ] Use Accept header to serve optimal format
- [ ] Set long cache headers (Cache-Control: max-age=31536000)
```

## Anti-patterns

- Don't use CSS `background-image` for content images — use `<img>` for native lazy loading
- Don't serve oversized images — resize to the maximum display size
- Don't skip width/height attributes — causes layout shift (CLS)
- Don't use PNG for photos — use JPEG/WebP/AVIF
- Don't inline base64 images larger than 4KB — increases HTML size
