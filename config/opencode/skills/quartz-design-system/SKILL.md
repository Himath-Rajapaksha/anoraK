---
name: quartz-design-system
description: Use when designing or building UIs with the Quartz monochrome design system — shadcn/ui token architecture, Vercel Geist type, Apple material. Applies when styling components, picking type scale, radii, shadows or motion, or wiring light/dark theming in a Quartz project.
---

# Quartz Design System

Industrial-grade monochrome theme: **40% type (Geist face + Quartz rules) ·
40% shadcn/ui components · 20% Apple material. Zero hue.** Contrast comes from
black/white blocks and type scale. `--destructive` (system red) is the only
colour, and only for errors.

Full audit tables, contrast math and provenance: `DESIGN.md` (same folder).
This skill is the working reference — copy the code, follow the rules.

## When to use

- Building or restyling UI in a Quartz project (web app, docs, dashboard).
- Reviewing UI code for Quartz compliance.
- Answering "what radius / weight / size does Quartz use for X?"

**Don't use** for: other themes, branded colour systems, print design.

## Quick reference

### Tokens (light `:root` / dark `.dark`)

| Token | Light | Dark |
|---|---|---|
| `--background` | `#ffffff` | `#070707` |
| `--foreground` | `#070707` | `#fbfbfb` |
| `--card` / `--card-foreground` | `#ffffff` / `#070707` | `#0f0f0f` / `#fbfbfb` |
| `--primary` / `--primary-foreground` | `#000000` / `#ffffff` | `#ffffff` / `#000000` |
| `--secondary` `--muted` `--accent` | `#fbfbfb` | `#1f1f1f` |
| `--muted-foreground` | `#545454` | `#bababa` |
| `--border` / `--input` | `#e9e9ea` | `#1f1f1f` / `#262626` |
| `--ring` | `#000000` | `#fbfbfb` |
| `--destructive` | `oklch(0.577 0.245 27.325)` | `oklch(0.637 0.237 25.331)` |
| `--radius` | `0.625rem` (10px) | `0.625rem` (10px) |
| `--radius-card` | `18px` | `18px` |
| `--destructive-foreground` | `oklch(0.985 0 0)` | `oklch(0.985 0 0)` |
| `--secondary-foreground` / `--accent-foreground` | `#070707` | `#fbfbfb` |

### Type

| Level | Size/line | Tracking | Weight |
|---|---|---|---|
| Display h1 | 72/72 | −0.03em | 400 |
| Section h2 | 48/48 | −0.03em | 400 |
| Card h3 | 24/32 | −0.4px | 400 |
| Lead | 18/28 | −0.2px | 400 | `--muted-foreground` |
| Body | 16/24 | 0 | 400 |
| Meta / buttons | 14/20 | 0 | **700** |

Fonts: `--font-sans: "Geist", -apple-system, BlinkMacSystemFont, ui-sans-serif, system-ui, sans-serif` ·
`--font-mono: "Geist Mono", ui-monospace, SFMono-Regular, Menlo, monospace`.
Load Geist **with italics** — the emphasis rule depends on them.

### Shape & motion

Radius: **6** checkbox · **10** controls · **14** alerts/notes · **18** cards ·
**32** inverted block · **pill** badges/chips only.
Shadows: `--shadow-xs` = `0 1px 2px 0 rgb(0 0 0 / 0.05)` (inputs) ·
`--shadow-sm` = `0 1px 2px 0 rgb(0 0 0 / .04), 0 2px 8px 0 rgb(0 0 0 / .06)`
(outline/secondary buttons) ·
`--shadow-md` = `0 2px 6px 0 rgb(0 0 0 / .06), 0 12px 28px 0 rgb(0 0 0 / .10)`
(cards — layered depth carries separation; hairlines only draw the edge).
Glass: `--surface-glass` = `color-mix(in srgb, var(--background) 80%, transparent)` +
`--glass-filter: saturate(180%) blur(20px)` — **never below 80% / 20px** (AA floor).
Motion: `--duration 250ms` · `--ease cubic-bezier(0.32, 0.72, 0, 1)` ·
`--ease-spring cubic-bezier(0.34, 1.4, 0.64, 1)` (button hover-in only, 1px lift).
`prefers-reduced-motion: reduce` → collapse transitions and cancel the lift.

## Implementation

Copy these verbatim. Component CSS reads tokens only — hardcode nothing.

### Button (all variants)

```css
.btn{
  display:inline-flex;align-items:center;justify-content:center;gap:8px;
  white-space:nowrap;font-family:var(--font-sans);font-size:14px;line-height:20px;
  font-weight:700;border-radius:var(--radius);height:36px;padding:0 16px;
  border:1px solid transparent;cursor:pointer;text-decoration:none;
  transition:all var(--duration) var(--ease);
}
.btn:focus-visible{outline:none;border-color:var(--ring);
  box-shadow:0 0 0 3px color-mix(in srgb,var(--ring) 50%,transparent)}
.btn:disabled{pointer-events:none;opacity:.5}
.btn:hover:not(:disabled){transition:all var(--duration) var(--ease-spring);
  transform:translateY(-1px)}
.btn--default{background:var(--primary);color:var(--primary-foreground)}
.btn--default:hover:not(:disabled){background:color-mix(in srgb,var(--primary) 90%,transparent)}
.btn--outline{background:var(--surface-glass);color:var(--foreground);
  border-color:color-mix(in srgb,var(--border) 70%,transparent);
  box-shadow:var(--shadow-sm);backdrop-filter:var(--glass-filter);
  -webkit-backdrop-filter:var(--glass-filter)}
.btn--outline:hover:not(:disabled){background:var(--accent)}
.dark .btn--outline{background:color-mix(in srgb,var(--input) 30%,transparent);
  border-color:transparent}
.dark .btn--outline:hover:not(:disabled){background:color-mix(in srgb,var(--input) 50%,transparent)}
.btn--secondary{background:var(--secondary);color:var(--secondary-foreground);
  box-shadow:var(--shadow-sm)}
.btn--ghost{background:transparent;color:var(--foreground);border-color:transparent}
.btn--ghost:hover:not(:disabled){background:var(--accent)}
.btn--destructive{background:var(--destructive);color:var(--destructive-foreground)}
.dark .btn--destructive{background:color-mix(in srgb,var(--destructive) 60%,transparent)}
.dark .btn--destructive:hover:not(:disabled){background:color-mix(in srgb,var(--destructive) 50%,transparent)}
.btn--link{background:transparent;color:var(--primary);padding:0;height:auto;
  text-underline-offset:4px}
.btn--link:hover:not(:disabled){text-decoration:underline;transform:none}
```

Sizes: xs `h-6 px-2 text-xs` · sm `h-8 px-3` · lg `h-10 px-6` · icon `size-9`.

### Card

```css
.card{background:var(--card);color:var(--card-foreground);
  border:1px solid color-mix(in srgb,var(--border) 60%,transparent);
  border-radius:var(--radius-card);box-shadow:var(--shadow-md);padding:24px}
.card--quiet{background:var(--secondary);border-color:transparent}
```

Meta row: mono, 13px, uppercase, `letter-spacing:.5px`, `--muted-foreground`,
separator `·` (middot), e.g. `APP DESIGN · JUL 2026`.

Stats row: value in display type (400, 52/54) or large mono, label mono
13px/20px uppercase `letter-spacing:1.92px` `--muted-foreground`, e.g. `5K+`
over `PROJECTS DELIVERED`.

Form labels: 14px weight 500. Hints/helper text: 13px `--muted-foreground`.
Page container: `max-width:1280px`, `padding:0 24px`, sections `80px` vertical
padding. Toggle `aria-label` format: `Switch theme, currently <state>`.

### Input / checkbox

```css
.control{font-family:var(--font-sans);font-size:14px;line-height:20px;color:var(--foreground);
  background:transparent;border:1px solid var(--input);border-radius:var(--radius);
  height:36px;padding:0 12px;box-shadow:var(--shadow-xs);
  transition:border-color var(--duration) var(--ease),box-shadow var(--duration) var(--ease)}
.control:focus{outline:none;border-color:var(--ring);
  box-shadow:0 0 0 3px color-mix(in srgb,var(--ring) 50%,transparent)}
.dark .control{background:color-mix(in srgb,var(--input) 30%,transparent)}
.dark .control:hover{background:color-mix(in srgb,var(--input) 50%,transparent)}
```

Light inputs are transparent; dark inputs get `input/30` fill. Checkbox: 16×16,
`calc(var(--radius) - 4px)` (6px), `shadow-xs`, 1px `--primary` border
(background transparent in both modes), checked = `--primary` fill with
white check drawn on an `::after` pseudo-element (`inset:0`,
`background:var(--primary-foreground)`, `transform:scale(0)` → `scale(1)` when
checked) using `clip-path:path("M14.28 4.72a.75.75 0 0 1 1.06 1.06l-7.25 7.25a.75.75 0 0 1-1.06 0L2.22 8.28a.75.75 0 0 1 1.06-1.06L8 11.94l6.28-7.22Z")`,
same ring focus.

### Alert (destructive is untinted)

```css
.alert{display:flex;gap:12px;padding:12px 16px;
  border-radius:calc(var(--radius-card) - 4px);
  border:1px solid var(--border);background:var(--card);
  font-size:14px;line-height:20px;color:var(--foreground)}
.alert--destructive{color:var(--destructive)}   /* text turns red, card stays the card */
.alert--destructive p{color:color-mix(in srgb,var(--destructive) 90%,transparent)}
```

Icons: lucide inline SVG only (`triangle-alert`, `circle-alert`, `arrow-right`,
`check`), 16px, `stroke:currentColor`. Never a text glyph as an icon.

### Frosted topbar

```css
.topbar{position:sticky;top:0;z-index:50;background:var(--surface-glass);
  backdrop-filter:var(--glass-filter);-webkit-backdrop-filter:var(--glass-filter);
  border-bottom:1px solid var(--border)}
```

### Theme cycle (light / dark / system)

```html
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Geist:ital,wght@0,100..900;1,100..900&family=Geist+Mono:wght@100..900&display=swap">
```

```js
var KEY='quartz-theme', root=document.documentElement;
function apply(state){
  var dark = state==='dark' || (state==='system' &&
    window.matchMedia('(prefers-color-scheme: dark)').matches);
  root.classList.toggle('dark', dark);
  if(state==='system') localStorage.removeItem(KEY); else localStorage.setItem(KEY,state);
}
// cycle on toggle: system → light → dark → system
```

Toggle button: glass outline button, text label (`Switch theme`), `aria-label`
announcing current state. Dark mode = `.dark` class on `<html>`; put
`color-scheme: light` inside `:root` and `color-scheme: dark` inside `.dark`
so browser chrome follows. Initial state: `system` (follows
`prefers-color-scheme`); cycle is system → light → dark → system.

## Common mistakes

| Mistake | Fix |
|---|---|
| Bold heading for emphasis | Italicise **one** word; headings stay 400 |
| Pill buttons | Pills are badges/chips only; controls are 10px |
| Any brand hue (blue links, green success) | Black, white, grey steps only; red = errors only |
| Square or 8px controls | Scale is 6/10/14/18/32/pill |
| `outline` + `outline-offset` for focus | `--ring` border + 3px ring at 50% |
| Tinted destructive alert bg | Card stays the card; **text** turns red |
| Full-opacity dark red fill + white text | `color-mix(… 60%)` — white on it is 7.56:1 |
| Glass below 80% / blur below 20px | AA fails under scrolling content |
| Mono on running text / sans on data | Mono = data (meta, indices, stats); sans = prose |
| `--destructive` for non-errors | It is semantic error colour, never decoration |

## Verification

Before calling UI done: every text/background pair ≥ 4.5:1 (WCAG AA) · focus
ring visible on all interactives · `prefers-reduced-motion` collapses motion ·
no console errors · theme cycle works and persists. See `DESIGN.md` §9 for the
method (headless Chromium + computed styles + relative-luminance math).
