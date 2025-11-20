# GitHub Actions Auto-Build Setup

GitHub will automatically build your APK every time you push code. No Android SDK needed on your computer!

## How It Works

1. You push code to GitHub (from phone, laptop, anywhere)
2. GitHub's servers automatically build the APK
3. Download APK from "Actions" tab or "Releases" page
4. Install on your phone

**Build time:** 3-5 minutes per push

## Initial Setup (One Time)

### Step 1: Create GitHub Repository

```bash
# On any computer (or use GitHub web interface)
cd CaffeineScramble
git init
git add .
git commit -m "Initial commit - Caffeine Scramble v1.0.0"

# Create repo on GitHub.com, then:
git remote add origin https://github.com/YOUR_USERNAME/caffeine-scramble.git
git branch -M main
git push -u origin main
```

### Step 2: First Build Triggers Automatically

As soon as you push, GitHub Actions will:
- Install Android SDK
- Install Cordova
- Build unsigned APK
- Upload to "Actions" artifacts

**Check progress:** Go to your repo → "Actions" tab

### Step 3: Download Your APK

**Option A - From Actions (for testing):**
1. Go to repo → "Actions" tab
2. Click the latest workflow run
3. Scroll down to "Artifacts"
4. Download `caffeine-scramble-apk.zip`
5. Extract and install

**Option B - From Releases (for distribution):**
When you push a tag (see below), APK appears in "Releases" page.

## Creating Releases (For F-Droid & Users)

### Tag a Release

```bash
# Tag the current commit
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

This triggers:
- Full APK build
- Automatic GitHub Release creation
- APK attached to release page
- F-Droid can track this tag

**Result:** 
`https://github.com/YOUR_USERNAME/caffeine-scramble/releases/tag/v1.0.0`

## APK Signing (Optional - For Google Play)

If you want to distribute outside F-Droid or on Play Store, you need signed APKs.

### Generate Keystore (One Time)

```bash
keytool -genkey -v -keystore release.keystore \
  -alias caffeine-scramble -keyalg RSA -keysize 2048 -validity 10000

# Fill in details:
# Password: [choose strong password]
# Name: Refined Web Solutions
# Organization: Refined Web Solutions
# City: Huntsville
# State: Texas
# Country: US
```

### Add Secrets to GitHub

1. Go to repo → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add these secrets:

**KEYSTORE_BASE64:**
```bash
# Convert keystore to base64
base64 release.keystore | tr -d '\n'
# Copy output, paste as secret value
```

**KEYSTORE_PASSWORD:** Your keystore password

**KEY_ALIAS:** `caffeine-scramble`

**KEY_PASSWORD:** Your key password (same as keystore password)

### Rebuild with Signing

```bash
git tag -a v1.0.1 -m "Release v1.0.1 - signed"
git push origin v1.0.1
```

Now GitHub builds **signed** APKs automatically!

## Workflow Features

### Automatic Builds On:
- ✅ Push to `main` branch
- ✅ Pull requests
- ✅ Git tags (creates releases)
- ✅ Manual trigger (click "Run workflow" in Actions tab)

### Build Outputs:
- **Unsigned APK:** Always generated, good for F-Droid/testing
- **Signed APK:** Only if keystore configured, needed for Play Store

### Artifact Storage:
- Kept for 30 days
- Download anytime from Actions tab
- Tagged releases kept forever

## Using From Your Phone

### Option 1: GitHub Mobile App
1. Install GitHub app
2. Go to your repo
3. Actions → Latest run → Artifacts
4. Download APK

### Option 2: Browser
1. Open github.com on phone
2. Navigate to repo → Actions
3. Download artifact
4. Install APK

### Option 3: Direct Release Link
Share this with users:
`https://github.com/YOUR_USERNAME/caffeine-scramble/releases/latest`

## Updating the App

### Regular Updates
```bash
# Make changes to www/index.html or other files
git add .
git commit -m "Fix bug in collision detection"
git push

# APK builds automatically in 3-5 minutes
# Download from Actions tab
```

### Version Releases
```bash
# Update version in config.xml
# <widget id="..." version="1.0.1" ...>

git add config.xml
git commit -m "Bump version to 1.0.1"
git tag -a v1.0.1 -m "Release v1.0.1 - Bug fixes"
git push origin main
git push origin v1.0.1

# Release page created automatically with APK attached
```

## F-Droid Integration

F-Droid will:
1. Monitor your tags automatically
2. Build APK themselves (reproducible builds)
3. Sign with their key
4. Publish to F-Droid store

**You just need to:**
- Push tags regularly
- F-Droid handles the rest

## Troubleshooting

### Build Failed?

Check Actions tab for error logs:

**Common issues:**
- `config.xml` syntax error
- Missing files in `www/`
- Cordova plugin conflicts (you have none, so unlikely)

**Fix:**
```bash
# Fix the error locally
git add .
git commit -m "Fix build error"
git push
# Automatically rebuilds
```

### APK Won't Install?

**Problem:** "App not installed" error

**Solution:** If upgrading, must use same signing key:
- Always use signed builds for distribution
- F-Droid handles this automatically
- Or always use unsigned for personal testing

## Cost

**FREE for public repos:**
- 2,000 build minutes/month
- Your builds take ~5 minutes each
- = 400 builds/month free
- More than enough!

**For private repos:**
- Same limits on free tier
- Pay for more if needed (unlikely)

## Advantages Over Local Building

✅ No Android SDK needed on your computer  
✅ Works from any device (phone, tablet, laptop)  
✅ Consistent build environment  
✅ Automatic release management  
✅ Easy sharing (GitHub Releases page)  
✅ F-Droid can track tags automatically  
✅ Professional CI/CD pipeline  
✅ Build logs for debugging  

## Next Steps

1. **Push to GitHub** (see Step 1)
2. **Wait 5 minutes** for first build
3. **Download APK** from Actions tab
4. **Test on phone**
5. **Tag v1.0.0** when ready
6. **Submit to F-Droid** with release link

Done! No local building needed ever.

## Status Badge (Optional)

Add to README.md:
```markdown
![Build Status](https://github.com/YOUR_USERNAME/caffeine-scramble/workflows/Build%20Android%20APK/badge.svg)
```

Shows green checkmark when builds succeed.

## Questions?

Check GitHub Actions logs for detailed build output. Every step is logged.
