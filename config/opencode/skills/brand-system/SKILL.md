---
name: brand-system
description: Use when implementing or extending a brand design system with consistent colors, typography, spacing, and component variants.
---

# Brand System

## When to Use This Skill
- Defining a color palette with primary, secondary, and semantic tokens
- Setting up a typographic scale with font sizes, weights, and line heights
- Creating a spacing and layout grid system
- Building component variants that follow brand conventions

## Workflow
1. Audit existing brand assets: logo, colors, fonts, spacing patterns
2. Define design tokens as CSS custom properties or a token file (JSON/YAML)
3. Set up the color palette: primary, secondary, neutral, semantic (success, warning, error)
4. Define the type scale: base size, modular scale ratio, font stack
5. Create the spacing scale: base unit, multiplier steps
6. Build component variants: buttons, inputs, cards, etc. with brand styles
7. Document usage guidelines with dos and don'ts
8. Publish as a shared package or Storybook

## Rules
- Use semantic tokens, not raw hex values — `--color-primary`, not `#007aff`
- Ensure sufficient contrast ratios for accessibility (WCAG AA minimum)
- Keep the token set minimal — don't add tokens for one-off uses
- Test components across light and dark themes
- Version the system and provide migration guides for breaking changes
