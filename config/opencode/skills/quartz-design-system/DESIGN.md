# Quartz — shadcn/ui × Vercel × Apple Design System

A **monochrome theme with shadcn/ui bones, Vercel's type face and Apple
material**. The token architecture is shadcn's (`:root` / `.dark`,
`--background`, `--primary`, `--radius`, `h-9` buttons, ring focus); the
components are stock shadcn geometry lightly Apple-softened (10px controls,
18px cards, layered shadows, frosted topbar, springy hover); the type face is
Vercel's **Geist / Geist Mono** under Quartz's type rules; the palette is
pure neutrals measured from a TailGrids template (provenance in §8).

**The blend: 40% type (Geist face + Quartz rules) · 40% shadcn components
· 20% Apple material.** Still **no hue** — the Apple and Vercel layers are
form only.

Status: **v1.0.0 — industrial grade, visually verified**. Files:

| File | Role |
|---|---|
| `quartz-tokens.css` | Tokens only — one `:root`, one `.dark`. No component rules. |
| `quartz.html` | The look: every token, type level, radius and component in one page. Open it in a browser. |
| `SKILL.md` | The same system as a skill an LLM can follow to design UIs. |

---

## 1. Design position

Quartz has **no brand hue**. Its system is built from three moves:

1. **Pure neutrals** — black ink, white canvas, one grey ramp. Contrast comes
   from black/white blocks, never from colour.
2. **Roman display type with italic emphasis** — Geist at weight 400 with tight
   tracking; a single italicised word inside a heading is the signature.
3. **Soft blocks** — whole inverted sections get 32px corners.

shadcn/ui contributes the *structure*: semantic role names that stay stable
while the skin changes, light/dark parity for free, drop-in components — and
the **anatomy of every control**: `h-9` height, ring focus, alpha-based
hovers, compact pills for badges only, untinted destructive alerts.

Vercel contributes the **face** (40% of the blend, form only): `Geist` for
everything structural and `Geist Mono` for data, both variable 100–900 with
true italics. The type *rules* stay Quartz's — 400 headings, 700 buttons,
one italic word, −0.03em display tracking, mono-for-data.

Apple contributes the **material** (the 20%): frosted `backdrop-filter`
surfaces, layered shadows that replace hard borders as the separation cue,
Apple-scale radii (10px controls, 18px sheets/cards), calmer −0.03em display
tracking, and 250ms deceleration with a springy hover. No blue, no accent —
form only.

**What we keep from shadcn:** role vocabulary, `.dark` class convention,
Tailwind v4 `@theme inline` wiring, `components.json`, component anatomy and
focus/height/alpha rules.
**What we take from the source palette:** every colour, the type scale and
rules, italic emphasis, mono-for-data, the 32px inverted block.
**What we take from Vercel:** the face — Geist and Geist Mono in place of
Inter and Anonymous Pro.
**What we take from Apple:** material (glass, layered depth), the softened
radius scale, −0.03em tracking, motion curves.
**What we drop:** shadcn's zinc/slate hue (true neutrals instead), the source
template's pill buttons (stock geometry instead), shadcn's 150ms timing
(Apple's 250ms), and any brand accent — Quartz defines none, Apple's blue
stays out.

---

## 2. Colour tokens

All values measured from the live template (computed styles, not source
guesses). Contrast ratios computed against the stated background.

### Light (`:root`)

| Token | Value | Use | Contrast |
|---|---|---|---|
| `--background` | `#ffffff` | page canvas | — |
| `--foreground` | `#070707` | brand ink: headings, primary text | 20.1:1 on white |
| `--card` / `--popover` | `#ffffff` | cards, popovers | — |
| `--secondary` / `--muted` / `--accent` | `#fbfbfb` | quiet fills: CTA band, input wells, hover | — |
| `--muted-foreground` | `#545454` | secondary copy, meta | 7.57:1 |
| `--primary` | `#000000` | solid buttons, inverted blocks | 21:1 |
| `--primary-foreground` | `#ffffff` | text on primary | 21:1 |
| `--border` / `--input` | `#e9e9ea` | 1px rules, input outlines | — |
| `--ring` | `#000000` | 3px focus ring at 50% alpha | — |
| `--destructive` | `oklch(0.577 0.245 27.325)` | system red — see Rules | 4.76:1 on white |
| `--destructive-foreground` | `oklch(0.985 0 0)` | text on red fills | 4.56:1 on `--destructive` |
| `--chart-1…5` | `#070707 #545454 #bababa #1d1f2c #e9e9ea` | greyscale data ramp | — |

### Dark (`.dark`)

| Token | Value | Use | Contrast |
|---|---|---|---|
| `--background` | `#070707` | page canvas (the template's footer black) | — |
| `--foreground` | `#fbfbfb` | headings, primary text | 19.47:1 |
| `--card` / `--popover` | `#0f0f0f` | cards lifted one step off the page | — |
| `--secondary` / `--muted` / `--accent` | `#1f1f1f` | quiet fills, borders-as-fills | — |
| `--muted-foreground` | `#bababa` | secondary copy | 10.38:1 |
| `--primary` | `#ffffff` | inverted fill (white on black) | 20.1:1 |
| `--primary-foreground` | `#000000` | text on primary | 20.1:1 |
| `--border` | `#1f1f1f` | hairlines | — |
| `--input` | `#262626` | input outlines (one step brighter than border) | — |
| `--ring` | `#fbfbfb` | focus ring | — |
| `--destructive` | `oklch(0.637 0.237 25.331)` | system red, brightened — see Rules | 5.02:1 on `--card` |
| `--destructive-foreground` | `oklch(0.985 0 0)` | text on red fills | 7.56:1 on `--destructive` at 60% |

### Rules

- **No hue, ever.** If a state needs emphasis, it gets black, white, or a
  grey step — not a colour.
- **`--destructive` is the only colour in the system.** It is shadcn's system
  red, kept because "error" is semantic, not brand. Never reuse it for
  non-error emphasis.
- **Destructive is assigned by role, not by shadcn's default swap.** shadcn
  ships a dark red `--destructive` with red `--destructive-foreground`; we
  need `--destructive` to *read as text* on `--card` in dark (alerts), so dark
  gets the bright red (5.02:1) and near-white `--destructive-foreground`.
  Consequence: in dark, red **fills** are used at `color-mix(… 60%)` — white on
  that mix is 7.56:1; full-opacity red with white text would be 3.66:1 and
  fails. Light keeps stock shadcn behaviour (white on red = 4.56:1).
- **Quiet fills are `#fbfbfb`, not grey.** In dark they become `#1f1f1f` —
  surfaces move *toward* the foreground in dark mode, never away.
- **Focus is a ring, shadcn's:** `border-color: var(--ring)` plus
  `box-shadow: 0 0 0 3px color-mix(in srgb, var(--ring) 50%, transparent)`.
  No `outline`, no offset.
- Body copy on white is `--foreground` at `#070707`, not pure `#000` — the
  softer black is the template's actual heading colour. `#000` is reserved
  for fills (buttons, blocks) where maximum weight matters.

---

## 3. Typography

| Level | Size / line | Tracking | Weight | Notes |
|---|---|---|---|---|
| Display (h1) | 72 / 72 | −2.16px (−0.03em) | 400 | never bold |
| Section (h2) | 48 / 48 | −1.44px (−0.03em) | 400 | never bold |
| Card title (h3) | 24 / 32 | −0.4px | 400 | |
| Lead | 18 / 28 | −0.2px | 400 | `--muted-foreground` |
| Body | 16 / 24 | 0 | 400 | |
| Meta / buttons | 14 / 20 | 0 | 700 | every button label is bold |

- **Families:** `Geist` (Vercel, variable 100–900 + italic) for everything
  structural, leading the stack with `-apple-system`/`BlinkMacSystemFont` as
  fallbacks; `Geist Mono` for data — eyebrows, meta rows, indices, stat
  labels, swatch values. Never the reverse.
- **Tracking is Apple-calm at −0.03em**, not the source template's −0.04em;
  small text (14px meta, button labels) tracks at 0. Apple does not squeeze
  UI text.
- **The signature move:** one word inside a roman heading set in *italic*.
  `Semantic tokens, *neutral* values.` Never two, never a whole phrase.
- **Headings are weight 400.** Emphasis in display type is the italic, not
  weight. The only weights in the system are 400 (text) and 700 (buttons).
- Eyebrows: mono, 13px, uppercase, `letter-spacing: 1.92px`,
  `--muted-foreground`, numbered (`01 —`, `02 —` …).

---

## 4. Shape & motion

| Token | Value | Applies to |
|---|---|---|
| `--radius` | `0.625rem` (10px) | controls: buttons, inputs |
| `--radius-card` | `18px` | cards, swatches — Apple sheet corners |
| `--radius-block` | `32px` | full-width inverted sections — the Quartz holdout |
| `--radius-pill` | `9999px` | **badges and chips only** — never buttons |
| `--shadow-xs` | `0 1px 2px 0 rgb(0 0 0 / 0.05)` | inputs, checkbox |
| `--shadow-sm` | `0 1px 2px 0 rgb(0 0 0 / .04), 0 2px 8px 0 rgb(0 0 0 / .06)` | outline & secondary buttons |
| `--shadow-md` | `0 2px 6px 0 rgb(0 0 0 / .06), 0 12px 28px 0 rgb(0 0 0 / .10)` | cards — depth carries separation |
| `--surface-glass` | `color-mix(in srgb, var(--background) 80%, transparent)` | topbar, outline buttons |
| `--glass-filter` | `saturate(180%) blur(20px)` | the Apple vibrancy filter |
| `--duration` | `250ms` | all transitions |
| `--ease` | `cubic-bezier(0.32, 0.72, 0, 1)` | default easing (Apple deceleration) |
| `--ease-spring` | `cubic-bezier(0.34, 1.4, 0.64, 1)` | button hover-in only (slight overshoot) |

Where each radius lands:

| Step | Value | Used by |
|---|---|---|
| sm | 6px | checkbox |
| control | 10px (`var(--radius)`) | buttons, inputs |
| alert | 14px (`calc(var(--radius-card) - 4px)`) | alerts, notes |
| card | 18px (`var(--radius-card)`) | cards, swatches |
| block | 32px | inverted section |
| pill | 9999px | badges, value chips |

- **Cards:** softened hairline `color-mix(in srgb, var(--border) 60%, transparent)`,
  `padding: 24px`, 18px radius, `--shadow-md` — the shadow separates, the border
  only draws the edge. Quiet variant fills `--secondary`, no border.
- **Material:** topbar and outline buttons use `--surface-glass` +
  `--glass-filter`. 80% opacity is the floor — at 72%, muted text over content
  underneath dropped to 3.80:1 (fail); 80% keeps it at 4.72:1 (AA) even with
  black text passing under the bar.
- **Inverted block:** `background: var(--primary)`, white type, 32px radius,
  `56px 48px` padding — the template's signature section.
- **Card meta rows are always mono, always uppercase** (`APP DESIGN` · `JUL 2026`).
- **Motion:** 250ms on `--ease`; button hover adds `--ease-spring` with a 1px
  lift (hover-in springs, hover-out returns to the calm curve). No hue, no
  bounce. `prefers-reduced-motion: reduce` → transitions collapse to ~0ms.

---

## 5. Component mapping (shadcn anatomy × Apple surface)

Anatomy and metrics from the shadcn **new-york-v4** registry
(`ui.shadcn.com/r/styles/…`, 2026-10-03); radii, shadows, material and timing
softened toward Apple per §4. Colour and type come from the tokens.

| shadcn component | As rendered here |
|---|---|
| `Button` | `rounded` (10px), `h-9 px-4 text-sm **font-bold (700)**` — bold labels on every variant; sizes xs `h-6 px-2 text-xs`, sm `h-8 px-3`, lg `h-10 px-6`, icon `size-9`; `transition-all 250ms --ease`, hover springs on `--ease-spring` with a 1px lift. default = `--primary` fill, hover `primary/90`; outline = **glass** (`--surface-glass` + `--glass-filter`) + `--shadow-sm`, hover `--accent` (dark: `input/30` fill, `input/50` hover); secondary = `--secondary` + `--shadow-sm`, hover `/80`; ghost = transparent, hover `--accent`; link = `--primary`, underline **on hover only**, `underline-offset-4`, no lift; destructive = `--destructive` (dark: `60%` mix), hover `90%`/`50%`; disabled `opacity:.5; pointer-events:none`; focus = `--ring` border + 3px ring. |
| `Card` | 18px (`--radius-card`), hairline at `border/60%`, `--card`, **`--shadow-md`** (layered depth), padding 24px. Mono uppercase meta row at top (the Quartz data rule). |
| `Badge` | **Still a pill** (`rounded-full` — stock shadcn), `px-2 py-0.5 text-xs`, `border: 1px solid transparent`; solid (primary), outline (1px `--border`), muted, destructive variants. Kept mono/uppercase for data consistency; dark destructive uses the 60% mix. |
| `Input` / `Textarea` / `Select` | `h-9 rounded (10px) px-3 text-sm`, transparent background (`input/30` in dark), `shadow-xs`, 1px `--input`, focus = `--ring` border + 3px ring at 50%. |
| `Checkbox` | 16×16, `calc(var(--radius) - 4px)` (6px), `shadow-xs`, checked = `--primary` fill with a white check, same ring focus. |
| `Alert` | 14px (`calc(--radius-card - 4px)`), `px-4 py-3 text-sm`, 1px `--border` on `--card`; destructive is **not tinted** — `text-destructive` on the card, description at `destructive/90`, `triangle-alert` lucide icon at 16px. Title `font-medium tracking-tight`. |
| `Table` | `text-sm`, header `h-10 px-2 font-medium` (rendered mono uppercase as the Quartz data rule), cells `p-2`, 1px bottom rules, row hover `muted/50`. Status cell as pill badge. |
| Topbar / sticky chrome | **Apple material:** `background: var(--surface-glass)` + `backdrop-filter: var(--glass-filter)`. Not a shadcn primitive — content reads through the bar as it scrolls under. |
| Inverted section (`section`-level) | `background: var(--primary)` + `--radius-block` (32px) — not a shadcn primitive, but the template's core pattern; implement as a wrapper class. |
| Sidebar | tokens already mapped (`--sidebar*`): white/`#070707` rail, `--sidebar-accent` hover. |

**The one place pills survive:** badges and value chips (`--radius-pill`).
Buttons and inputs sit at the Apple control radius (10px), checkbox at 6px.

**Icons:** lucide, inline SVG only — `triangle-alert`, `circle-alert`,
`arrow-right`, `check`. Never a text glyph (`!`, `i`, `→`) as an icon.

---

## 6. Wiring

### Tokens

`quartz-tokens.css` is the source of truth — one `:root`, one `.dark`,
nothing else. `color-scheme: light` / `color-scheme: dark` live inside those
blocks so the browser UI (scrollbars, form controls) follows the theme.

### Tailwind v4

```css
@import "tailwindcss";
@import "../path/to/quartz-tokens.css";

@theme inline {
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-card: var(--card);
  --color-card-foreground: var(--card-foreground);
  --color-popover: var(--popover);
  --color-popover-foreground: var(--popover-foreground);
  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);
  --color-secondary: var(--secondary);
  --color-secondary-foreground: var(--secondary-foreground);
  --color-muted: var(--muted);
  --color-muted-foreground: var(--muted-foreground);
  --color-accent: var(--accent);
  --color-accent-foreground: var(--accent-foreground);
  --color-destructive: var(--destructive);
  --color-destructive-foreground: var(--destructive-foreground);
  --color-border: var(--border);
  --color-input: var(--input);
  --color-ring: var(--ring);
  --color-sidebar: var(--sidebar);
  --color-sidebar-foreground: var(--sidebar-foreground);
  --color-sidebar-primary: var(--sidebar-primary);
  --color-sidebar-accent: var(--sidebar-accent);
  --color-sidebar-border: var(--sidebar-border);

  --radius-sm: calc(var(--radius) - 4px);   /* 6px  — checkbox   */
  --radius-md: calc(var(--radius) - 2px);   /* 8px  — reserved   */
  --radius-lg: var(--radius);               /* 10px — controls   */
  --radius-xl: var(--radius-card);          /* 18px — cards      */

  --shadow-xs: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.04), 0 2px 8px 0 rgb(0 0 0 / 0.06);
  --shadow-md: 0 2px 6px 0 rgb(0 0 0 / 0.06), 0 12px 28px 0 rgb(0 0 0 / 0.10);

  --font-sans: "Geist", -apple-system, BlinkMacSystemFont, ui-sans-serif,
               system-ui, sans-serif;
  --font-mono: "Geist Mono", ui-monospace, SFMono-Regular, Menlo, monospace;
}
```

Dark mode switches on the **`.dark` class** (`@custom-variant dark (&:is(.dark *))`).

### `components.json` (shadcn CLI)

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "app/globals.css",
    "baseColor": "neutral",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  },
  "iconLibrary": "lucide"
}
```

`baseColor: neutral` — closest stock base; values are overridden by our
tokens anyway. Generated components need **four** edits to match this theme:
button labels `font-medium` → `font-bold` (every button is 700), headings at
`font-normal` (Quartz never bolds a heading), any `slate`/`zinc` hex
swapped for `var(--muted-foreground)`, and radius/shadow utilities remapped
(`rounded-md` → `rounded-lg` for controls, `shadow-sm` → `shadow-md` for
cards). Badges keep their mono/uppercase treatment; sticky chrome gets the
glass material. Everything else ships untouched.

### Fonts

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Geist:ital,wght@0,100..900;1,100..900&family=Geist+Mono:wght@100..900&display=swap">
```

Geist must be loaded with **italics** — the emphasis rule depends on it.

---

## 7. Dos and don'ts

**Do**

- Set display headings at weight 400 with −0.03em tracking.
- Set every button label at weight **700** — bold is the button's signature.
- Put exactly one italic word in a heading.
- Give controls the Apple radius (10px) and `h-9` height with ring focus.
- Keep badges and chips as pills; that is the one rounded-full holdout.
- Let layered shadows (`--shadow-md`) carry card separation; hairlines only
  draw the edge (`border/60%`).
- Frost sticky chrome and outline buttons with `--surface-glass` +
  `--glass-filter`; never below 80% opacity.
- Use mono, uppercase, letterspaced meta rows for dates, categories, indices.
- Reach for `#fbfbfb` / `#1f1f1f` before adding any new surface colour.
- Use the full-width inverted block (32px radius) as the page's punctuation.

**Don't**

- Don't introduce a brand hue — Apple's blue stays out; the layer is form only.
- Don't bold a heading to emphasise it — italicise a word instead.
- Don't reintroduce pill-shaped buttons — pills belong to badges and chips.
- Don't use square or 8px controls: scale is 6 (checkbox) / 10 (control) /
  14 (alert) / 18 (card) / 32 (block) / pill (badges).
- Don't use `outline`/`outline-offset` for focus; use the 3px ring.
- Don't tint the destructive alert background — the card stays the card and
  the *text* turns red.
- Don't put mono on running text or sans on data tables.
- Don't use `--destructive` for anything that isn't an error.
- Don't take dark red fills to full opacity — use the 60% mix so white text
  clears AA.
- Don't drop glass opacity under 80% or blur under 20px — text over scrolling
  content fails AA below that.

---

## 8. Audit appendix — palette provenance & how these values were obtained

Palette provenance: values measured from a free TailGrids template
(`https://nexstudio.demos.tailgrids.com/`), fetched and measured headlessly
via Chrome DevTools Protocol on 2026-10-02. The palette is documented here;
the brand is Quartz.

- **Colour** — computed styles of heading, body, muted, button, card, border
  and footer elements; every hex above is an observed value, not an estimate.
- **Type** — computed `font-size` / `line-height` / `letter-spacing` /
  `font-weight` at each heading level; h1 72/72 −2.88px and h2 48/48 −1.92px
  confirmed directly.
- **Shape** — computed `border-radius`: buttons `9999px`, cards `24px`,
  inverted sections `32px`. **Deviations in this release:** controls now sit at
  the Apple radius (10px), cards/sheets at 18px, alerts/notes at 14px, glass
  material on sticky chrome; the 32px inverted block and the pill-for-badges
  rule are the surviving source-template shapes.
- **Contrast** — WCAG 2.1 relative-luminance formula applied to the measured
  pairs; all text pairs pass AA (≥4.5:1), most pass AAA. Re-checked after the
  blend: light destructive text 4.76:1, dark destructive text 5.02:1, white on
  dark destructive mix 7.56:1, dark badge 7.56:1; glass worst-case (muted text
  over black content showing through) 4.72:1 light / 5.99:1 dark at 80%.
- **Motion** — 300ms transitions observed in the source; **Quartz uses
  Apple's 250ms / `cubic-bezier(0.32, 0.72, 0, 1)`** with a springy hover on
  `cubic-bezier(0.34, 1.4, 0.64, 1)`. The source template uses Framer Motion
  for scroll reveals (not reproduced in this CSS-only theme).
- **Fonts** — `Geist` (variable 100–900 + italic) and `Geist Mono`
  (100–900), confirmed via `document.fonts` and computed `font-family`.
- The original template ships **no dark mode**. Dark values are a reasoned
  extension: `#070707` (the template's own footer black) becomes the canvas,
  `#fbfbfb` (its CTA-band white) becomes the text, and quiet fills step from
  `#fbfbfb` to `#1f1f1f`.

## 9. Verification record

`quartz.html` + `quartz-tokens.css` were rendered at 1440px (headless
Chromium, CDP) and checked light and dark in tagged tiles on 2026-10-03.

**Apple round (40/40/20 blend):**

- `border-radius` on buttons **10px**, on cards **18px**; `font-weight: 700`
  on all 20 buttons ✓
- Computed topbar: `color(srgb 1 1 1 / 0.8)` +
  `backdrop-filter: saturate(1.8) blur(20px)`; glass tile shows content
  reading through the bar in both themes ✓
- Card `box-shadow` is the layered `--shadow-md`; card hairline at 60% ✓
- `--duration 250ms`, `--ease cubic-bezier(0.32, 0.72, 0, 1)`,
  `--ease-spring cubic-bezier(0.34, 1.4, 0.64, 1)` ✓
- `--radius-card 18px`; radii strip fits sm 6 / control 10 / alert 14 /
  card 18 / block 32 / pill in one row ✓
- h1 renders 72px / −2.16px (−0.03em); Geist Mono resolves for mono ✓
- Glass contrast at 80%: light 4.72:1, dark 5.99:1 (72% failed at 3.80:1 —
  the reason the token sits at 80%) ✓
- Theme cycle works, no console errors, no duplicate IDs ✓

**Vercel round (type face swap):**

- `document.fonts` reports Geist roman + italic and Geist Mono (all
  100–900) loaded; Inter/Anonymous Pro no longer referenced ✓
- Computed `font-family` on body resolves `Geist, -apple-system, …` ✓
- `check('italic 72px Geist')` and `check('bold 14px Geist')` both true ✓
- h1 letter-spacing still −2.16px (−0.03em); buttons still `font-weight: 700`
  at 10px radius ✓
- Display, body, and mono specimens render in Geist / Geist Mono in tagged
  tiles, light and dark ✓

**Earlier rounds (still passing):** 14 role swatches flip with the theme ✓ ·
six button variants + five sizes ✓ · inputs (h-9, ring focus), custom
checkbox, compact badges, untinted destructive alert with lucide icon, table
row hover, inverted block, footer ✓ · dark `input/30` outline fill, 60%
destructive mix, alert text 5.02:1 ✓

**v1.0.0 release round (industrial grade):**

- Rewritten under Quartz branding end to end — title, wordmark (`QuaRTZ`),
  eyebrow, footer, token header, docs, localStorage key `quartz-theme` ✓
- Added: meta description, `color-scheme` hint, inline monochrome SVG
  favicon, skip-to-content link, `prefers-reduced-motion` also cancels the
  button hover lift ✓
- Full-page screenshots captured light + dark (1440px, `assets/`) with zero
  console errors ✓
- Contrast script re-run: every shipped pair passes AA; the three FAIL rows
  are prohibited combinations (72% glass, full-opacity dark red + white,
  black-on-red badge) documented as rules ✓
- Probe: Geist roman/italic + Geist Mono loaded, h1 −2.16px, buttons 700 @
  10px radius, `ERRORS []` ✓
