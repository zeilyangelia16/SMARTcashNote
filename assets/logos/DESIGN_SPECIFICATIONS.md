# CashNote Logo - Design Specifications Reference

## Design Philosophy

The CashNote logo system represents a **modern fintech platform** that combines:
- **Financial Management** (Wallet concept)
- **Growth & Progress** (Upward trends)
- **Trust & Security** (Professional, clean design)
- **Simplicity** (Minimalist aesthetic)

---

## Color Palette - Psychological Impact

### Primary Color: Indigo/Purple (#4F46E5)
- **Psychology**: Trust, reliability, wisdom, professionalism
- **Usage**: Main identity, primary UI elements
- **Accessibility**: WCAG AAA compliant with white
- **Emotions Evoked**: Safe, intelligent, modern, premium

```
RGB: 79, 70, 229
HSL: 243°, 83%, 60%
CMYK: 66%, 69%, 0%, 10%
```

### Secondary Color: White (#FFFFFF)
- **Psychology**: Cleanliness, simplicity, light, trust
- **Usage**: Contrast, highlights, secondary elements
- **Accessibility**: Perfect contrast ratio (21:1)
- **Emotions Evoked**: Clean, minimal, professional, clear

---

## Design Elements Breakdown

### Element 1: Wallet Icon
**Symbolism**: Money management, savings, financial control
- **Shape**: Rounded rectangle with subtle flap
- **Proportions**: Golden ratio-inspired (1.618:1 width-to-height)
- **Curves**: 15-20% border radius for friendly feel
- **Detail Level**: Minimalist, 2-3 layers of information

### Element 2: Letter "C"
**Integration**: Natural curve, primary letterform
- **Style**: Modern sans-serif interpretation
- **Weight**: 65-75px stroke width
- **Opacity**: Full opacity (1.0) for primary visibility
- **Purpose**: Brand nameplate integration

### Element 3: Growth Chart
**Symbolism**: Financial progress, increasing wealth, positive trends
- **Bars**: 4-tier ascending pattern
- **Opacity Gradient**: Increases from left to right
- **Trend Line**: Smooth curve connecting peaks
- **Arrow**: Optional upward direction indicator

### Element 4: Financial Symbols
**Details**: Dollar sign, security checks, coins
- **Placement**: Secondary, supporting elements
- **Opacity**: 0.2-0.4 (subtle, not dominant)
- **Size**: Smaller than main elements
- **Purpose**: Contextual reinforcement

---

## Visual Hierarchy

```
Level 1 (Primary) - 100% opacity
└─ Main wallet shape
└─ Letter "C"

Level 2 (Secondary) - 80-90% opacity
└─ Growth chart bars
└─ Trend line

Level 3 (Tertiary) - 25-50% opacity
└─ Inner highlights
└─ Supporting symbols
└─ Coin details

Level 4 (Background) - 8-15% opacity
└─ Subtle context circles
└─ Accent lines
└─ Decorative elements
```

---

## Geometric Foundation

### Grid Structure
- **Base Unit**: 32px × 32px modular grid
- **Icon Dimensions**: 32×32 grid units (1024×1024 pixels)
- **Center Point**: 16, 16 (middle of grid)
- **Alignment**: All elements snap to grid for precision

### Key Proportions
```
Total Canvas:     1024×1024 pixels
Safe Area:        ±480px radius from center
Wallet Width:     470px (±40px margin)
Wallet Height:    400px (±40px margin)
"C" Radius:       170px
Chart Width:      220px
Chart Height:     260px
```

### Spacing Rules
- **Outer Margin**: 40-60px from canvas edge
- **Element Spacing**: 15-20px between major elements
- **Internal Padding**: 15-25px within shapes
- **Line Spacing**: 10-15px between text/icons

---

## Stroke & Line Weight Guidelines

| Element | Width (px) | Usage | Effect |
|---------|-----------|-------|--------|
| Chart Bars | 30px | Primary chart bars | Prominent |
| Trend Line | 12-14px | Growth indicator | Connecting |
| Letter "C" | 65-75px | Primary letterform | Bold |
| Inner Details | 8-12px | Subtle outlines | Definition |
| Decorative Lines | 6-8px | Accent elements | Minimal |
| Coins/Circles | 2-4px | Fine details | Intricate |

---

## Opacity & Transparency Layers

### Standard Opacity Values Used
```
Background context:     0.08  (very subtle, near invisible)
Decorative accents:     0.10-0.15  (subtle background)
Secondary elements:     0.25-0.35  (visible but not dominant)
Tertiary details:       0.40-0.50  (clearly visible)
Primary elements:       0.70-0.90  (strong visibility)
Main icon:              1.00  (full opacity)
```

### Layering Technique
1. **Base Layer**: Wallet foundation (1.0)
2. **Accent Layer**: Inner highlights (0.15)
3. **Detail Layer**: Supporting icons (0.3)
4. **Background Layer**: Context elements (0.08)

---

## Roundness & Border Radius

### Recommended Radius Values
| Element | Radius % | Pixels (1024px) | Purpose |
|---------|----------|-----------------|---------|
| Wallet corners | 18% | ~184px | Main shape |
| Chart bars | 12-15% | ~35-55px | Soft edges |
| Coins | 50% | Circular | Pure circles |
| Accent lines | 8-10% | ~8-10px | Pill-shaped |
| Details | 5% | ~5px | Subtle rounding |

### Rationale
- **High radius (50%)**: Creates friendly, approachable feel
- **Medium radius (15-20%)**: Balances modern with approachable
- **Low radius (5%)**: Technical precision, fine details

---

## Shadow & Depth Effects

### Recommended Approach: Minimal Shadows
**Philosophy**: Flat design with opacity-based depth

Instead of drop shadows:
- Use lighter opacity layers for "raised" elements
- Use darker opacity layers for "recessed" elements
- Rely on color variation and layering

### If Shadows Are Needed
```
Shadow: 0px 4px 12px rgba(79, 70, 229, 0.12)
OR
Shadow: 0px 2px 8px rgba(0, 0, 0, 0.08)
```

**Note**: Shadows should be extremely subtle; prefer opacity layering.

---

## Typography Integration

### Logo Wordmark Specification (Optional)
If pairing logo with text "CashNote":

```
Font Family: Inter, Segoe UI, or equivalent modern sans-serif
Font Size: 60-80px
Font Weight: 600 (Semi-bold) or 700 (Bold)
Letter Spacing: -1px to -2px (tight kerning)
Color: #4F46E5
Text Alignment: Center or left-aligned with logo above
Margin Above Logo: 20-30px
```

---

## Animation Considerations

### Recommended Animation Effects
1. **Splash Screen**: Subtle 2-3 second fade-in + scale
2. **Loading**: Rotating gradient or pulsing opacity
3. **Success State**: 0.5s scale bounce + slight color shift
4. **Error State**: Shake animation + desaturate

### Animation Timing
- **Fade-in**: 500-800ms (ease-out)
- **Pulse**: 2000ms infinite (ease-in-out)
- **Bounce**: 300-400ms (cubic-bezier)
- **Shake**: 200-300ms (linear)

---

## Dark Mode Adaptation

### Dark Mode Specifications
For dark backgrounds or OLED displays:

**Invert colors**:
- Primary: Indigo → Light Indigo/Lavender (#A5B4FC)
- White → Dark background (transparent)

**Alternative approach**:
- Use original colors with reduced opacity
- Add subtle glow effect (box-shadow: 0 0 20px rgba(165, 180, 252, 0.3))

```
Dark Mode Logo Colors:
Primary: #A5B4FC (Indigo-300)
Secondary: #FFFFFF (White, 80% opacity)
Background: Transparent or #0F172A (Slate-900)
```

---

## Export Quality Checklist

### Vector Quality (SVG)
- ✅ No rasterized elements
- ✅ All curves use Bezier paths
- ✅ Stroke widths scale proportionally
- ✅ Minimum stroke width: 2px at 1024px scale
- ✅ No compressed/lossy filters

### Raster Quality (PNG)
- ✅ Minimum resolution: 1024×1024 at 72 DPI
- ✅ For print: 300 DPI equivalent
- ✅ 8-bit PNG or 24-bit PNG with alpha
- ✅ No artifacts or compression blocks
- ✅ Transparent background preserved

### Format Specifications

| Format | Use Case | DPI | Quality |
|--------|----------|-----|---------|
| **SVG** | Web, Flutter, scaling | N/A | Lossless |
| **PNG** | App icons, raster | 72-150 | High |
| **PDF** | Print, archival | 300 | Vector |
| **TIFF** | Professional print | 300+ | Lossless |
| **JPG** | Web preview only | 72 | Lossy (not recommended) |

---

## Brand Consistency Rules

### Must-Follow Guidelines
1. ✅ Never change color to anything other than #4F46E5 + #FFFFFF
2. ✅ Never rotate logo more than ±5° (if at all)
3. ✅ Never stretch or distort aspect ratio
4. ✅ Never add drop shadows heavier than 0.12 opacity
5. ✅ Never remove the transparent background
6. ✅ Never add text directly over the logo

### Can-Do Modifications
- ✓ Scale proportionally
- ✓ Change opacity (0.5-1.0)
- ✓ Adjust spacing/margins around logo
- ✓ Apply subtle animation effects
- ✓ Adjust to light or dark backgrounds

---

## Size Reference Guide

### Minimum Legible Sizes
| Context | Minimum Size | Recommended Size |
|---------|--------------|------------------|
| **Favicon** | 16×16 px | 32×32 px |
| **Navigation Icon** | 24×24 px | 48×48 px |
| **App Icon (Store)** | 512×512 px | 1024×1024 px |
| **Splash Screen** | 200×200 px | 300-400×300-400 px |
| **Header/Banner** | 80×80 px | 150-200×150-200 px |
| **Social Media** | 256×256 px | 512×512 px |
| **Print (1"×1")** | 72×72 px @ 72 DPI | 300×300 px @ 300 DPI |

---

## Performance Optimization

### SVG File Size
- **Target**: < 50 KB
- **Current Logos**: ~15-25 KB each
- **Optimization**: SVG can be gzipped for web delivery

### PNG File Size
- **Target**: < 200 KB
- **Recommended**: 100-150 KB
- **Compression**: Maximum PNG compression with no quality loss

### Web Implementation
```html
<!-- Preload for faster rendering -->
<link rel="preload" as="image" href="logo.svg">

<!-- Lazy load for below-fold content -->
<img loading="lazy" src="logo.svg" alt="CashNote Logo">
```

---

## Testing Checklist

- [ ] Logo displays correctly at 16×16 pixels (favicon)
- [ ] Logo displays correctly at 512×512 pixels (app store)
- [ ] Logo remains readable in grayscale
- [ ] Logo maintains quality when scaled 2x and 3x
- [ ] Colors are accurate in different color spaces (RGB, CMYK)
- [ ] SVG renders identically across browsers
- [ ] PNG exports have clean edges (no anti-aliasing artifacts)
- [ ] Transparent background is truly transparent (not white)
- [ ] File sizes are within performance targets
- [ ] Accessibility: Sufficient color contrast (4.5:1+)

---

## Historical Reference

**Design Inspiration**: Modern fintech applications (Stripe, Square, PayPal, Wise)

**Color Theory**: Indigo represents:
- Financial stability (banking tradition)
- Modern technology (digital, contemporary)
- Trust and security (confidence, reliability)
- Intelligence (wisdom, knowledge)

**Shape Philosophy**:
- Rounded edges: Friendly, approachable
- Wallet icon: Clear financial purpose
- Growth chart: Positive trend, success
- Letter "C": Brand identification, wordmark

---

**Document Version**: 1.0
**Last Updated**: May 31, 2026
**Status**: Reference Complete
