# CashNote Logo - Quick Implementation Guide

## Files Created

| File | Description | Use Case |
|------|-------------|----------|
| `cashnote_logo_v1_wallet_c.svg` | Wallet + Letter C | App icon, minimalist approach |
| `cashnote_logo_v2_note_c.svg` | Financial Note + Letter C | Alternative branding, documentation feel |
| `cashnote_logo_v3_wallet_chart_c.svg` | Wallet + Growth Chart + C | **RECOMMENDED** - Primary app icon |
| `cashnote_logo_icon_only.svg` | Icon without "C" letterform | Simplified icon, small sizes |
| `BRAND_GUIDELINES.md` | Complete brand guidelines | Reference documentation |

---

## Quick Setup (3 Steps)

### Step 1: Verify Assets Are Configured
Check that `pubspec.yaml` includes:
```yaml
flutter:
  assets:
    - assets/logos/
```

### Step 2: Choose Your Primary Logo
For app icon: **Use `cashnote_logo_v3_wallet_chart_c.svg`** (most complete)

### Step 3: Export to PNG for App Stores

Use one of these methods:

#### Method A: Online (Easiest)
1. Go to [CloudConvert.com](https://cloudconvert.com/svg-to-png)
2. Upload SVG file
3. Download PNG at 1024×1024
4. Repeat for Android and iOS sizes

#### Method B: Using Flutter svg Package
Add to `pubspec.yaml`:
```yaml
dependencies:
  flutter_svg: ^2.0.0
```

---

## Using Logos in Flutter Code

### Display Logo as Image
```dart
import 'package:flutter_svg/flutter_svg.dart';

// In your widget
SvgPicture.asset(
  'assets/logos/cashnote_logo_v3_wallet_chart_c.svg',
  width: 200,
  height: 200,
)
```

### Usage Examples

#### 1. Splash Screen
```dart
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(
          'assets/logos/cashnote_logo_v3_wallet_chart_c.svg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
```

#### 2. App Bar Logo
```dart
AppBar(
  title: SvgPicture.asset(
    'assets/logos/cashnote_logo_icon_only.svg',
    width: 40,
    height: 40,
  ),
  centerTitle: true,
)
```

#### 3. Navigation Logo
```dart
SvgPicture.asset(
  'assets/logos/cashnote_logo_icon_only.svg',
  width: 48,
  height: 48,
  color: Colors.indigo, // Optional color tint
)
```

#### 4. About Screen
```dart
Column(
  children: [
    SvgPicture.asset(
      'assets/logos/cashnote_logo_v3_wallet_chart_c.svg',
      width: 150,
      height: 150,
    ),
    SizedBox(height: 20),
    Text(
      'CashNote',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4F46E5),
      ),
    ),
  ],
)
```

---

## Color Reference for Flutter

```dart
// Brand Colors
const Color primaryIndigo = Color(0xFF4F46E5);
const Color white = Color(0xFFFFFFFF);
const Color lightGray = Color(0xFFF3F4F6);
const Color darkGray = Color(0xFF1F2937);

// Material Colors with brand indigo
const MaterialColor brandIndigo = MaterialColor(
  0xFF4F46E5,
  <int, Color>{
    50: Color(0xFFF8F7FF),
    100: Color(0xFFF0ECFF),
    200: Color(0xFFE0DCFF),
    300: Color(0xFFCEC6FF),
    400: Color(0xFFB4A7FF),
    500: Color(0xFF4F46E5),
    600: Color(0xFF4639CC),
    700: Color(0xFF3E32B3),
    800: Color(0xFF362B9A),
    900: Color(0xFF2E2481),
  },
);
```

---

## Android Setup

### Step 1: Export PNG Files
Export from SVG to PNG at these sizes:
- **mdpi**: 48×48 → `res/mipmap-mdpi/ic_launcher.png`
- **hdpi**: 72×72 → `res/mipmap-hdpi/ic_launcher.png`
- **xhdpi**: 96×96 → `res/mipmap-xhdpi/ic_launcher.png`
- **xxhdpi**: 144×144 → `res/mipmap-xxhdpi/ic_launcher.png`
- **xxxhdpi**: 192×192 → `res/mipmap-xxxhdpi/ic_launcher.png`

### Step 2: Update AndroidManifest.xml
```xml
<application
    android:label="CashNote"
    android:icon="@mipmap/ic_launcher"
    android:roundIcon="@mipmap/ic_launcher_round"
    ...>
</application>
```

### Step 3: Run Flutter
```bash
flutter pub get
flutter run
```

---

## iOS Setup

### Step 1: Export PNG Files
Create App Icon Set:
- 1024×1024 (App Store)
- 180×180 (iPhone 3x)
- 167×167 (iPad Pro)
- 152×152 (iPad 2x)
- 120×120 (iPhone 2x)
- 87×87 (Spotlight)
- 80×80 (Settings)
- 58×58 (Spotlight small)

### Step 2: Add to Xcode
1. Open `ios/Runner.xcworkspace`
2. Navigate to `Runner > Assets.xcassets > AppIcon`
3. Drag and drop PNG files to corresponding slots
4. Verify all slots are filled

### Step 3: Update Info.plist
```xml
<key>CFBundleIcons</key>
<dict>
    <key>CFBundlePrimaryIcon</key>
    <dict>
        <key>CFBundleIconFiles</key>
        <array>
            <string>Icon-App-60x60@2x</string>
            <string>Icon-App-60x60@3x</string>
        </array>
    </dict>
</dict>
```

---

## Web Setup

### Step 1: Update web/index.html
```html
<head>
  <!-- Icon for browser tab -->
  <link rel="icon" type="image/svg+xml" href="favicon.svg">
  <link rel="icon" type="image/png" href="favicon.png">
  
  <!-- Apple touch icon -->
  <link rel="apple-touch-icon" href="apple-touch-icon.png">
</head>
```

### Step 2: Place SVG in web Directory
```
web/
├── favicon.svg
├── favicon.png
└── apple-touch-icon.png
```

### Step 3: Serve and Test
```bash
flutter run -d chrome
```

---

## Logo Preview Checklist

- [ ] Logo looks good at **24×24 pixels** (notification icon)
- [ ] Logo looks good at **48×48 pixels** (app drawer)
- [ ] Logo looks good at **192×192 pixels** (splash screen)
- [ ] Logo recognizable in **black & white** mode
- [ ] Logo maintains **color contrast** against backgrounds
- [ ] No **jagged edges** at any scale
- [ ] Transparent background **preserved**
- [ ] Works on **light and dark themes**

---

## Color Theme Configuration

### Add to your main.dart or theme.dart
```dart
ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.indigo,
  primaryColor: Color(0xFF4F46E5),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF4F46E5),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF4F46E5),
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
)
```

---

## Common Issues & Solutions

### Issue: SVG Not Displaying
**Solution**: Ensure `flutter_svg` package is installed
```bash
flutter pub add flutter_svg
```

### Issue: Logo Colors Look Wrong
**Solution**: Remove color filters or check opacity settings
```dart
SvgPicture.asset(
  'assets/logos/cashnote_logo_v3_wallet_chart_c.svg',
  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), // Remove if not needed
)
```

### Issue: App Icon Not Updating
**Solution**: Clear build cache
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: PNG Export Quality Poor
**Solution**: Increase export DPI/density to 300+
```bash
convert -density 300 -resize 1024x1024 input.svg output.png
```

---

## Recommended Logo Usage by Screen

| Screen | Logo | Size | Style |
|--------|------|------|-------|
| **Splash** | `cashnote_logo_v3_wallet_chart_c.svg` | 200-300px | Centered, animated |
| **App Bar** | `cashnote_logo_icon_only.svg` | 40-48px | Left-aligned |
| **Navigation Drawer** | `cashnote_logo_v3_wallet_chart_c.svg` | 80-100px | Centered, header |
| **Profile** | `cashnote_logo_icon_only.svg` | 60-80px | Circular frame |
| **About** | `cashnote_logo_v3_wallet_chart_c.svg` | 150px | Large, centered |
| **Error Screen** | `cashnote_logo_icon_only.svg` | 100px | Greyscale tinted |

---

## Next Steps

1. ✅ Choose primary logo variation
2. ✅ Export to PNG for all required sizes
3. ✅ Set up Android app icon
4. ✅ Set up iOS app icon
5. ✅ Add flutter_svg to pubspec.yaml
6. ✅ Implement in screens (splash, app bar, etc.)
7. ✅ Test on physical devices
8. ✅ Submit to App Store and Google Play

---

**Questions?** Refer to `BRAND_GUIDELINES.md` for detailed specifications.

**Last Updated**: May 31, 2026
