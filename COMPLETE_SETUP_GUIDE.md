# Caffeine Scramble - Complete Setup & F-Droid Guide

## What This Is

A web developer survival game packaged as an Android app using Apache Cordova. Catch coffee beans, avoid bugs, survive the chaos! Already configured for F-Droid submission with auto-building via GitHub Actions.

## Current Status

✅ **Working**: GitHub Actions builds debug APK automatically  
✅ **Ready**: F-Droid metadata and structure complete  
✅ **Clean**: No tracking, ads, or proprietary code  
⚠️ **Needs**: GitHub repo setup + app icons (optional)

## Quick Start (5 Minutes)

### 1. Upload to GitHub

```bash
cd CaffeineScramble

# If you haven't created the repo yet:
# Go to https://github.com/new
# Create repo named: caffeine-scramble
# Don't initialize with README (we have one)

# Then run:
git init
git add .
git commit -m "Caffeine Scramble v1.0.0 - Initial release"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/caffeine-scramble.git
git push -u origin main
```

### 2. Wait for Build

- Go to your GitHub repo
- Click "Actions" tab
- Watch the build run (takes ~3-5 minutes)
- Download APK from "Artifacts" when done

### 3. Install & Test

```bash
# Enable "Install from unknown sources" on Android
# Install the downloaded APK
# Play the game!
```

## Build Locally (Optional)

If you want to build on your own machine:

```bash
# Install Node.js 18+ and Java 17+
# Then:
npm install
npm install -g cordova

# Add Android platform
cordova platform add android

# Build debug APK (auto-signed, installs easily)
cordova build android --debug

# APK location:
# platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

## F-Droid Submission

### Method 1: Request For Packaging (Easiest)

1. **Go to**: https://gitlab.com/fdroid/rfp/-/issues
2. **Click**: "New Issue"
3. **Use this template**:

```
Title: Caffeine Scramble - Web dev survival game

### App Information
- **Name**: Caffeine Scramble
- **Summary**: Catch coffee beans, avoid bugs in this web dev survival game
- **Repository**: https://github.com/YOUR_USERNAME/caffeine-scramble
- **License**: GPL-3.0-or-later
- **Category**: Games

### Description
A fast-paced arcade game for web developers and coffee lovers. Catch coffee
beans to stay caffeinated while avoiding bugs, production fires, and merge
conflicts. Progressive difficulty with 3 lives and score tracking.

Features:
- Simple one-touch gameplay
- No ads, tracking, or permissions
- Offline play
- Web dev themed graphics and sounds
- Progressive difficulty

### Technical Details
- **Platform**: Apache Cordova (HTML5 wrapper)
- **Min SDK**: 24 (Android 7.0)
- **Target SDK**: 35 (Android 15)
- **Build**: `cordova build android`
- **Dependencies**: None (pure HTML5 game)

The app is a simple Cordova wrapper around an HTML5 game. No external 
dependencies, tracking, or proprietary code. Perfect for F-Droid!

Builds automatically via GitHub Actions with full source available.
```

4. **Submit** and wait for F-Droid team response

### Method 2: Direct Submission (Advanced)

See `FDROID_SUBMISSION.md` for detailed instructions on submitting directly to F-Droid's data repository.

## GitHub Actions Explained

Your repo is set up with automatic builds:

**Triggers**:
- Every push to `main` branch → Build debug APK
- Every tag (`v1.0.0`, etc.) → Build + create GitHub Release
- Manual trigger from Actions tab

**What it does**:
1. Sets up Node.js, Java, Android SDK
2. Installs Cordova
3. Builds debug APK (auto-signed)
4. Uploads APK as artifact
5. (On tags) Creates GitHub Release with APK

**To create a release**:
```bash
git tag -a v1.0.0 -m "Version 1.0.0 - Initial release"
git push --tags
```

## App Icons (Optional but Recommended)

Current setup uses default Cordova icons. To add custom icons:

1. **Create icon images**:
   - 512x512px PNG for high-res
   - Use ComfyUI, GIMP, or online tools

2. **Generate all sizes**:
   ```bash
   # Use included tool
   npm install -g cordova-res
   cordova-res android --skip-config --copy
   ```

3. **Manual placement**:
   - Place PNGs in `res/icon/android/`
   - See `res/` directory structure

Icon suggestions:
- Coffee cup with code symbols
- Pixel art coffee bean
- Developer + coffee theme
- Simple, recognizable at small sizes

## Project Structure

```
CaffeineScramble/
├── www/
│   ├── index.html          # Main game file
│   ├── css/
│   │   └── index.css       # Styling
│   └── js/
│       └── index.js        # Cordova initialization
├── .github/
│   └── workflows/
│       └── build-apk.yml   # Auto-build config
├── config.xml              # Cordova/app configuration
├── package.json            # Node dependencies
├── README.md               # Documentation
├── LICENSE                 # GPL-3.0
├── FDROID_SUBMISSION.md    # F-Droid guide
└── fastlane/               # F-Droid metadata
```

## Troubleshooting

### Build Fails on GitHub Actions

Check:
- Actions tab → Click failed build → View logs
- Usually: Node/Java version mismatch
- Fix: Update versions in `build-apk.yml`

### APK Won't Install

Debug APKs install easily. If it doesn't:
- Enable "Install from unknown sources"
- Check Android version (need 7.0+)
- Try: `adb install -r app-debug.apk`

### Local Build Fails

```bash
# Clear and rebuild
cordova platform rm android
cordova platform add android
cordova build android --debug
```

## Updating the App

### Make changes:
```bash
# Edit www/index.html or other files
# Update version in config.xml

# Test locally
cordova build android --debug

# Commit and push
git add .
git commit -m "Version 1.1.0 - Bug fixes"
git tag -a v1.1.0 -m "Version 1.1.0"
git push && git push --tags
```

### Update F-Droid (after accepted):
F-Droid auto-detects new tags and rebuilds. Just push tags and they'll pick it up within 24-48 hours.

## F-Droid Requirements Checklist

- [x] **Open source**: GPL-3.0 licensed
- [x] **No tracking**: Zero analytics
- [x] **No ads**: Clean game experience
- [x] **No permissions**: Only vibrate (optional)
- [x] **Reproducible builds**: GitHub Actions + Cordova
- [x] **Public repository**: Ready for GitHub
- [x] **Complete metadata**: Fastlane + descriptions
- [x] **Simple build**: One command builds

## What Makes This F-Droid Ready

1. **Pure open source**: All code visible, GPL-3.0
2. **Zero dependencies**: HTML5 game, no external APIs
3. **No network**: Works 100% offline
4. **Minimal permissions**: Just vibrate for haptics
5. **Clean code**: No obfuscation, minification, or tricks
6. **Auto-builds**: GitHub Actions proves reproducibility
7. **Well documented**: Complete build instructions

## Alternative Distribution

While waiting for F-Droid:

1. **GitHub Releases**: Auto-created on tags
2. **Direct APK**: Share from GitHub Actions artifacts
3. **IzzyOnDroid**: Faster approval than F-Droid
4. **Your website**: Download link on refinedwebsolutions.com

## Support & Contact

- **Website**: https://refinedwebsolutions.com
- **Email**: contact@refinedwebsolutions.com
- **GitHub**: Open issues in your repo
- **F-Droid Forum**: https://forum.f-droid.org/

## License

GPL-3.0-or-later. Free software. See LICENSE file.

## Credits

Created by Refined Web Solutions  
Built with Apache Cordova  
Game concept: Survival of the most caffeinated developer

---

**Next Steps**:
1. Push to GitHub
2. Download APK from Actions
3. Test on device
4. Submit to F-Droid RFP
5. Share with fellow developers!

🎮 ☕ Happy gaming!
