---
name: accessibility
description: "Build WCAG 2.1 AA-compliant interfaces — semantic HTML, ARIA patterns, keyboard navigation, screen reader testing, and automated accessibility auditing."
license: MIT
---

Accessibility is not a feature — it's a requirement. 15% of the world
has a disability. If your interface isn't accessible, you're excluding
millions of users and exposing yourself to legal risk.

## Semantic HTML first

Use the right HTML element before reaching for ARIA:

```html
<!-- Bad: div soup -->
<div class="button" onclick="submit()">Submit</div>

<!-- Good: native element -->
<button type="submit">Submit</button>

<!-- Bad: div pretending to be a tab panel -->
<div class="tab" role="tab" onclick="switchTab()">Tab 1</div>

<!-- Good: proper ARIA when native elements don't exist -->
<div role="tablist" aria-label="Settings">
  <button role="tab" aria-selected="true" aria-controls="panel-1">Tab 1</button>
  <button role="tab" aria-selected="false" aria-controls="panel-2">Tab 2</button>
</div>
<div role="tabpanel" id="panel-1" aria-labelledby="tab-1">Content 1</div>
```

## Keyboard navigation

Every interactive element must be keyboard accessible:

```typescript
// Focus trap for modals
function useFocusTrap(ref: React.RefObject<HTMLElement>) {
  useEffect(() => {
    const el = ref.current;
    if (!el) return;

    const focusable = el.querySelectorAll(
      'a[href], button:not([disabled]), input:not([disabled]), ' +
      'select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
    );
    const first = focusable[0] as HTMLElement;
    const last = focusable[focusable.length - 1] as HTMLElement;

    function handleKeyDown(e: KeyboardEvent) {
      if (e.key !== 'Tab') return;

      if (e.shiftKey) {
        if (document.activeElement === first) {
          e.preventDefault();
          last.focus();
        }
      } else {
        if (document.activeElement === last) {
          e.preventDefault();
          first.focus();
        }
      }
    }

    el.addEventListener('keydown', handleKeyDown);
    first?.focus();

    return () => el.removeEventListener('keydown', handleKeyDown);
  }, [ref]);
}
```

## Color contrast

WCAG AA requires:
- Normal text (< 18pt): **4.5:1** contrast ratio
- Large text (≥ 18pt or 14pt bold): **3:1** contrast ratio
- UI components and graphical objects: **3:1** contrast ratio

```typescript
// Contrast checker utility
function getContrastRatio(hex1: string, hex2: string): number {
  const luminance = (hex: string) => {
    const rgb = [hex.slice(1, 3), hex.slice(3, 5), hex.slice(5, 7)]
      .map(c => parseInt(c, 16) / 255)
      .map(c => c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4));
    return 0.2126 * rgb[0] + 0.7152 * rgb[1] + 0.0722 * rgb[2];
  };

  const l1 = Math.max(luminance(hex1), luminance(hex2));
  const l2 = Math.min(luminance(hex1), luminance(hex2));
  return (l1 + 0.05) / (l2 + 0.05);
}
```

## Screen reader patterns

```html
<!-- Live regions for dynamic content -->
<div aria-live="polite" aria-atomic="true">
  {searchResults.length} results found
</div>

<!-- Hidden but focusable skip links -->
<a href="#main-content" class="sr-only focus:not-sr-only">
  Skip to main content
</a>

<!-- Image alt text decision tree -->
<img src="chart.png" alt="Sales increased 40% from Q1 to Q2 2024" />
<img src="decorative-border.png" alt="" role="presentation" />
```

## Testing checklist

1. **Automated**: axe-core, Lighthouse, eslint-plugin-jsx-a11y
2. **Keyboard**: Tab through entire page, verify focus order and visible focus
3. **Screen reader**: NVDA (Windows), VoiceOver (Mac), TalkBack (Android)
4. **Zoom**: 200% zoom without horizontal scrolling
5. **Color**: Simulate color blindness with browser devtools

## Common violations

- Missing `alt` text on images
- Low color contrast ratios
- No visible focus indicator
- Missing form labels
- Inaccessible custom components (modals, dropdowns, tabs)
- No `lang` attribute on `<html>`
- Missing page title
