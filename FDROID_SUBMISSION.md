# F-Droid Submission Guide for Caffeine Scramble

## Quick Checklist

✅ App is 100% open source (MIT License)  
✅ No proprietary dependencies  
✅ No tracking, analytics, or ads  
✅ Minimal permissions (VIBRATE only)  
✅ Builds reproducibly with Cordova  
✅ All source code on GitHub  
✅ Fastlane metadata included  

## Submission Process

### 1. Prepare Your Repository

```bash
# Initialize git
git init
git add .
git commit -m "Initial commit - Caffeine Scramble v1.0.0"

# Create GitHub repo and push
git remote add origin https://github.com/YOUR_USERNAME/caffeine-scramble.git
git branch -M main
git push -u origin main

# Tag the release
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

### 2. Test Build Locally

Make sure the app builds successfully:

```bash
# Install Android SDK if you haven't
# See README.md for full setup

# Test build
./build.sh

# Test the APK
adb install platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

### 3. Submit to F-Droid

**Option A: Request for Packaging (Recommended for first-timers)**

1. Go to: https://gitlab.com/fdroid/rfp/-/issues
2. Click "New Issue"
3. Use this template:

```markdown
**App Name:** Caffeine Scramble

**Package ID:** com.refinedwebsolutions.caffeinescramble

**Source Code:** https://github.com/YOUR_USERNAME/caffeine-scramble

**License:** MIT

**Description:**
A web dev survival arcade game where you catch coffee beans while avoiding bugs, fires, and skulls. Simple, fun, no ads, no tracking.

**Why this app should be in F-Droid:**
- 100% open source with MIT license
- No proprietary dependencies
- No tracking or analytics
- Minimal permissions (vibrate only)
- Fun, original game with web dev humor
- Works completely offline

**Additional Info:**
Built with Apache Cordova. Metadata included in fastlane/metadata/. 
Ready for reproducible builds.
```

**Option B: Direct Submission (if you have F-Droid contributor access)**

1. Fork: https://gitlab.com/fdroid/fdroiddata
2. Add metadata file: `metadata/com.refinedwebsolutions.caffeinescramble.yml`
3. Copy contents from `fastlane/metadata/android/en-US/full_description.txt`
4. Submit merge request

### 4. Metadata File for F-Droid

The `fastlane/metadata/` directory contains all required metadata:

- `title.txt` - App name
- `short_description.txt` - One-line summary (max 80 chars)
- `full_description.txt` - Full app description

F-Droid will also need:

- Screenshots (optional but recommended)
- Feature graphic (optional)
- App icon (automatically extracted from APK)

### 5. Creating Screenshots

Run the app and take screenshots showing:
1. Main gameplay screen
2. High score/game over screen
3. Level progression

Save as PNG:
- `fastlane/metadata/android/en-US/images/phoneScreenshots/1.png`
- `fastlane/metadata/android/en-US/images/phoneScreenshots/2.png`
- `fastlane/metadata/android/en-US/images/phoneScreenshots/3.png`

Recommended size: 1080x1920 or 1440x2560

## F-Droid Build Process

F-Droid will:
1. Clone your repo at the tagged version
2. Run `cordova build android --release`
3. Sign with their key
4. Publish to their repository

Build time: Usually 2-4 weeks for first submission.

## What Makes This App F-Droid Ready?

### ✅ No Anti-Features

F-Droid tracks "anti-features" that warn users:
- ❌ No ads
- ❌ No tracking
- ❌ No non-free dependencies
- ❌ No required proprietary services
- ❌ No excessive permissions

### ✅ Reproducible Builds

- Uses Apache Cordova (standard build tool)
- No binary blobs
- All dependencies are open source
- Gradle builds are deterministic

### ✅ Proper Licensing

- MIT License (OSI approved)
- All code is original or properly attributed
- No proprietary assets

## After Submission

### Monitoring Status

Check your RFP issue or merge request for:
- Build errors (rare with Cordova)
- Metadata questions
- License verification
- Permission justification

### Approval Timeline

- **RFP Review:** 1-2 weeks
- **First Build:** 2-4 weeks
- **Publication:** Immediately after successful build

### Updates

For future updates:
1. Tag new version: `git tag v1.0.1`
2. Push tag: `git push origin v1.0.1`
3. F-Droid auto-updates within 24-48 hours

## Troubleshooting

### "Build failed - SDK version"
Update `config.xml` android-targetSdkVersion to F-Droid's current supported version.

### "Permission not justified"
Add explanation in metadata about why VIBRATE permission is used (haptic feedback).

### "Non-free dependency detected"
Check all Cordova plugins. This app uses zero plugins, so shouldn't happen.

## Alternative: Self-Hosted Repository

If F-Droid submission takes too long, host your own F-Droid repository:

1. Build and sign APKs
2. Create F-Droid repository: https://f-droid.org/docs/Setup_an_F-Droid_App_Repo/
3. Share repository URL with users
4. They add your repo to F-Droid app

## Contact

If you have questions about F-Droid submission:
- F-Droid Matrix: #fdroid:f-droid.org
- F-Droid Forum: https://forum.f-droid.org/

## Resources

- F-Droid Docs: https://f-droid.org/docs/
- Build Metadata Reference: https://f-droid.org/docs/Build_Metadata_Reference/
- Inclusion Policy: https://f-droid.org/docs/Inclusion_Policy/
