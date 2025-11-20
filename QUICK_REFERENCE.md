# Caffeine Scramble - Quick Reference

## 🚀 2-Minute Deploy

```bash
cd CaffeineScramble
git init && git add . && git commit -m "v1.0.0"
git remote add origin https://github.com/YOUR_USERNAME/caffeine-scramble.git
git push -u origin main
```

Wait 5 min → Actions tab → Download APK → Install → Done!

## 📦 What You Got

- ✅ **Complete Cordova project** - Ready to build
- ✅ **GitHub Actions CI/CD** - Auto-builds on push
- ✅ **F-Droid metadata** - Submission ready
- ✅ **GPL-3.0 license** - Open source compliant
- ✅ **Debug APK workflow** - Installs immediately
- ✅ **Zero dependencies** - Pure HTML5 game

## 🎮 About the Game

**Caffeine Scramble**: Web dev survival game  
- Catch coffee beans (stay caffeinated)
- Avoid bugs, fires, merge conflicts
- 3 lives, progressive difficulty
- High score tracking

## 🏗️ Build Commands

```bash
# Local build
cordova build android --debug

# Output location
platforms/android/app/build/outputs/apk/debug/app-debug.apk

# Install on device
adb install app-debug.apk
```

## 📱 F-Droid Submission

**RFP (Easy way)**:
1. Go to: https://gitlab.com/fdroid/rfp/-/issues
2. Create issue with app info (template in COMPLETE_SETUP_GUIDE.md)
3. Wait for F-Droid team

**Direct (Advanced)**:
- Fork: https://gitlab.com/fdroid/fdroiddata
- Add metadata file
- Create merge request

## 🔧 Key Files

- `www/index.html` - Game code (540 lines)
- `config.xml` - App configuration
- `.github/workflows/build-apk.yml` - CI/CD
- `fastlane/metadata/` - F-Droid descriptions
- `COMPLETE_SETUP_GUIDE.md` - Full documentation

## ⚙️ Configuration

**App ID**: `com.refinedwebsolutions.caffeinescramble`  
**Version**: 1.0.0  
**Min Android**: 7.0 (API 24)  
**Target Android**: 15 (API 35)  
**Permissions**: Vibrate only

## 🎯 Next Steps

1. **Test locally** (optional): `cordova build android`
2. **Push to GitHub**: See 2-minute deploy above
3. **Download APK**: From GitHub Actions artifacts
4. **Test on device**: Install and play
5. **Submit F-Droid**: Use RFP template

## 📚 Documentation

- **COMPLETE_SETUP_GUIDE.md** - Comprehensive guide
- **FDROID_SUBMISSION.md** - F-Droid details
- **GITHUB_ACTIONS_SETUP.md** - CI/CD info
- **README.md** - Project overview

## 🐛 Troubleshooting

**Build fails**: Check Actions logs, update Node/Java versions  
**APK won't install**: Enable "Unknown sources", check Android 7.0+  
**Local build issues**: `cordova platform rm android && cordova platform add android`

## ✅ F-Droid Checklist

- [x] Open source (GPL-3.0)
- [x] No tracking/analytics
- [x] No ads
- [x] No internet permission
- [x] Reproducible build
- [x] Public repository
- [x] Complete metadata

## 📞 Support

- Website: https://refinedwebsolutions.com
- Email: contact@refinedwebsolutions.com

---

**TL;DR**: Push to GitHub → Wait 5 min → Download APK → Install → Play! 🎮☕
