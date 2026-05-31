# CashNote Logo & Brand Guidelines

## Overview
This document outlines the CashNote brand identity, logo variations, and usage guidelines for the personal finance application.

---

## Brand Identity

### Brand Values
- **Trustworthy**: Secure, reliable financial management
- **Simple**: Easy to understand and use
- **Smart**: Intelligent financial insights
- **Modern**: Contemporary fintech aesthetics
- **Professional**: Enterprise-grade design quality

### Color Palette

| Color | Hex Code | Usage | RGB |
|-------|----------|-------|-----|
| **Primary Purple/Indigo** | `#4F46E5` | Main brand color, UI elements | 79, 70, 229 |
| **White** | `#FFFFFF` | Backgrounds, contrast elements | 255, 255, 255 |
| **Light Gray** | `#F3F4F6` | Secondary backgrounds | 243, 244, 246 |
| **Dark Gray** | `#1F2937` | Text, typography | 31, 41, 55 |

### Typography
- **Primary Font**: Inter, Segoe UI, or similar modern sans-serif
- **Font Weight**: 600 (Bold) for headings, 400-500 (Regular) for body text
- **Style**: Clean, minimalist, friendly tone

---

## Logo Variations

### Variation 1: Wallet + Letter "C"
**File**: `cashnote_logo_v1_wallet_c.svg`
- **Concept**: Stylized wallet with integrated "C" letterform
- **Primary Elements**:
  - Wallet icon representing money management
  - Curved "C" letter naturally integrated into the design
  - Financial growth bars as secondary indicator
  - Subtle coin detail
- **Best For**: App icon, primary branding, small sizes
- **Size**: Optimized for 1024x1024 (scales well to any size)

### Variation 2: Financial Note + Letter "C"
**File**: `cashnote_logo_v2_note_c.svg`
- **Concept**: Book/notebook with financial note and integrated "C"
- **Primary Elements**:
  - Open book/note representing record-keeping
  - Bold "C" letterform on the right page
  - Financial symbols (dollar sign, growth chart)
  - Page lines suggesting documentation
- **Best For**: Alternative branding, web headers, marketing materials
- **Psychological Appeal**: Trust through documentation, record-keeping

### Variation 3: Wallet + Growth Chart + Letter "C"
**File**: `cashnote_logo_v3_wallet_chart_c.svg`
- **Concept**: Comprehensive financial symbol (most detailed)
- **Primary Elements**:
  - Wallet foundation element
  - Large "C" letterform
  - Ascending bar chart with trend line
  - Upward growth arrow indicator
  - Coin symbol representing value
- **Best For**: Primary app icon, detailed marketing, feature highlights
- **Psychological Appeal**: Growth, progress, financial success

---

## Design Specifications

### Dimensions
- **Standard Size**: 1024 × 1024 pixels (square)
- **File Format**: SVG (vector) - scalable to any size
- **Background**: Transparent (PNG export recommended for app stores)
- **Aspect Ratio**: 1:1 (perfect square)

### Visual Characteristics
- **Style**: Flat design with subtle depth
- **Roundness**: Friendly, curved corners (border-radius: 15-20%)
- **Line Weight**: Consistent 8-14px for strokes
- **Opacity Layering**: Multi-layered transparency for depth
- **Shadows**: Minimal/absent - relies on color variation and opacity
- **Spacing**: Balanced, centered composition with breathing room

### Color Usage
- **Primary Color**: Indigo/Purple (#4F46E5) - 60-70% of design
- **Accent Color**: White (#FFFFFF) - 30-40% of design
- **Opacity Range**: 0.08 to 1.0 for layering effects
- **Contrast Ratio**: WCAG AA compliant (4.5:1 minimum)

---

## Usage Guidelines

### App Icon Implementation

#### Android
1. Place logo SVGs in `android/app/src/main/res/`
2. Create mipmap folders: mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi
3. Export logos as PNG with proper DPI:
   - mdpi: 48×48 (160 dpi)
   - hdpi: 72×72 (240 dpi)
   - xhdpi: 96×96 (320 dpi)
   - xxhdpi: 144×144 (480 dpi)
   - xxxhdpi: 192×192 (640 dpi)
4. Update `AndroidManifest.xml`:
   ```xml
   <application android:icon="@mipmap/ic_launcher" />
   ```

#### iOS
1. Place logos in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
2. Create PNG exports at 1024×1024 for App Store
3. Export smaller sizes:
   - 180×180 (3x for iPhone)
   - 167×167 (iPad Pro)
   - 152×152 (iPad 2x)
   - 120×120 (iPhone 2x)
4. Update `ios/Runner/Info.plist`:
   ```xml
   <key>CFBundleIcons~ipad</key>
   <dict>
       <key>CFBundlePrimaryIcon</key>
       <dict>
           <key>CFBundleIconFiles</key>
           <array>
               <string>Icon-App-120x120@1x.png</string>
               <!-- Additional sizes -->
           </array>
       </dict>
   </dict>
   ```

### Flutter Implementation

#### Using Logo in Code
```dart
// Display logo in Flutter app
Image.asset(
  'assets/logos/cashnote_logo_v3_wallet_chart_c.svg',
  width: 200,
  height: 200,
)

// With flutter_svg package (recommended for SVG)
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(
  'assets/logos/cashnote_logo_v3_wallet_chart_c.svg',
  width: 200,
  height: 200,
)
```

#### Adding to pubspec.yaml
```yaml
flutter:
  assets:
    - assets/logos/
```

### Recommended Logo Placement

| Context | Variation | Size | Spacing |
|---------|-----------|------|---------|
| **App Icon** | V3 (most complete) | 1024×1024 | – |
| **Splash Screen** | V3 | 300-400px | 40px margin |
| **Navigation Header** | V1 (simplified) | 48-64px | 12px padding |
| **Web Header** | V2 (distinct) | 200-300px | 20px padding |
| **About Screen** | V3 | 150-200px | 30px margin |
| **Loading Screen** | V1 | 100-150px | Centered |
| **Marketing Poster** | V3 | 500-1000px | 60px margin |

---

## Export Instructions

### SVG to PNG Export (for different platforms)

#### Using Online Tools (Recommended for quick exports)
1. Visit [CloudConvert.com](https://cloudconvert.com) or [Zamzar.com](https://www.zamzar.com)
2. Upload SVG file
3. Convert to PNG
4. Download and save to respective directories

#### Using Command Line (ImageMagick)
```bash
# Install ImageMagick
# macOS: brew install imagemagick
# Windows: Download from imagemagick.org
# Linux: sudo apt-get install imagemagick

# Convert SVG to PNG at 1024x1024
convert -density 150 -resize 1024x1024 input.svg output.png

# Convert for Android assets
convert -density 150 -resize 192x192 input.svg xxxhdpi/ic_launcher.png
convert -density 150 -resize 144x144 input.svg xxhdpi/ic_launcher.png
convert -density 150 -resize 96x96 input.svg xhdpi/ic_launcher.png
convert -density 150 -resize 72x72 input.svg hdpi/ic_launcher.png
convert -density 150 -resize 48x48 input.svg mdpi/ic_launcher.png
```

#### Using Figma (Professional Approach)
1. Import SVG into Figma
2. Resize to 1024×1024
3. Export as PNG with 2x and 3x variants
4. Download all sizes

---

## Branding Consistency Checklist

- [ ] Logo maintains recognizability at 24×24px minimum size
- [ ] Color scheme uses only #4F46E5 (purple) and #FFFFFF (white)
- [ ] No drop shadows or heavy effects
- [ ] Aspect ratio maintained at 1:1 (square)
- [ ] Transparent background preserved for all exports
- [ ] Rounded corners maintained (15-20% border radius)
- [ ] All text is either "CashNote" in clean sans-serif or minimal
- [ ] Spacing and margins are consistent with brand guidelines
- [ ] Vector quality preserved (no pixelation)

---

## Technical Notes

### SVG Features Used
- ✅ SVG paths for smooth curves
- ✅ Opacity layering for depth
- ✅ Rounded rectangles and circles
- ✅ Stroke and fill attributes
- ✅ Viewbox for responsive scaling
- ✅ No embedded fonts (uses shape-based design)

### Browser Compatibility
- Chrome/Edge: ✅ Full support
- Firefox: ✅ Full support
- Safari: ✅ Full support
- Opera: ✅ Full support

### Mobile Compatibility
- iOS: ✅ Recommended (exports to PNG)
- Android: ✅ Recommended (exports to PNG)
- Web: ✅ Direct SVG support

---

## Next Steps

1. **Choose Primary Variation**: Select V1, V2, or V3 as main logo
2. **Export to PNG**: Convert SVG to PNG for app stores
3. **Platform Integration**: Add to Android and iOS projects
4. **Test at Scales**: Verify logo clarity at different sizes
5. **Brand Guidelines**: Distribute this document to design team
6. **Consistency**: Apply logo consistently across all branding

---

## File Locations

```
assets/
├── logos/
│   ├── cashnote_logo_v1_wallet_c.svg          (Variation 1)
│   ├── cashnote_logo_v2_note_c.svg            (Variation 2)
│   └── cashnote_logo_v3_wallet_chart_c.svg    (Variation 3)
```

---

**Last Updated**: May 31, 2026
**Brand Version**: 1.0
**Status**: Ready for Implementation
