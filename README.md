# Caffeine Scramble

A web dev survival arcade game - catch coffee beans, avoid bugs!

## About

Caffeine Scramble is a fast-paced arcade game where you play as a web developer trying to survive the chaos of production. Catch falling coffee beans and donuts for points while avoiding bugs (❌), fires (🔥), and deadly skulls (💀). Three strikes and you're out!

## Features

- 🎮 Simple one-touch controls (keyboard or touch)
- 📈 Progressive difficulty - speeds up as you level
- 😄 Web dev themed humor and flavor text
- 🚫 No ads, no tracking, no permissions (except vibrate)
- 🔓 100% open source
- 📴 Works completely offline

## Building

### Prerequisites

You'll need:
- Node.js (v14+)
- Java Development Kit (JDK 17)
- Android SDK with build-tools
- Gradle

### Quick Setup (Ubuntu/Fedora)

```bash
# Install Java 17
sudo apt install openjdk-17-jdk  # Ubuntu
sudo dnf install java-17-openjdk-devel  # Fedora

# Install Android command line tools
# Download from: https://developer.android.com/studio#command-tools
mkdir -p ~/Android/Sdk/cmdline-tools
cd ~/Android/Sdk/cmdline-tools
unzip ~/Downloads/commandlinetools-linux-*.zip
mv cmdline-tools latest

# Set environment variables (add to ~/.bashrc)
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64  # Ubuntu
# export JAVA_HOME=/usr/lib/jvm/java-17-openjdk  # Fedora

# Install SDK components
sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"

# Accept licenses
sdkmanager --licenses
```

### Build APK

```bash
# Install dependencies
npm install

# Build debug APK (for testing)
cordova build android

# Build release APK (for F-Droid/distribution)
cordova build android --release

# Output location:
# platforms/android/app/build/outputs/apk/debug/app-debug.apk
# platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk
```

### Sign APK (for manual distribution)

```bash
# Generate keystore (one-time)
keytool -genkey -v -keystore caffeine-scramble.keystore \
  -alias caffeine-scramble -keyalg RSA -keysize 2048 -validity 10000

# Sign the APK
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
  -keystore caffeine-scramble.keystore \
  platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk \
  caffeine-scramble

# Align the APK
zipalign -v 4 \
  platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk \
  caffeine-scramble-v1.0.0.apk
```

## F-Droid Submission

This app is designed for F-Droid submission:

1. **Push to GitHub** with proper tags
2. **Submit to F-Droid** at https://gitlab.com/fdroid/rfp/-/issues
3. **F-Droid metadata** is included in `fastlane/metadata/`

### F-Droid Requirements Met

✅ 100% open source (MIT License)  
✅ No proprietary dependencies  
✅ No tracking or analytics  
✅ No ads  
✅ Minimal permissions (only VIBRATE)  
✅ Reproducible builds (Cordova-based)  

## Development

The game is built with vanilla JavaScript and HTML5 Canvas. No frameworks, no build process needed for the web version.

### Project Structure

```
CaffeineScramble/
├── www/
│   └── index.html          # Complete game (self-contained)
├── config.xml              # Cordova configuration
├── platforms/android/      # Android build files
└── fastlane/metadata/      # F-Droid metadata
```

### Web Version

Just open `www/index.html` in any modern browser. Works on desktop and mobile.

## Controls

**Desktop:** Arrow keys or A/D to move  
**Mobile:** Touch and drag to move the cup

## License

MIT License - see LICENSE file

Copyright (c) 2025 Refined Web Solutions

## Author

Created by Charles / Refined Web Solutions  
Website: https://refinedwebsolutions.com  
Contact: contact@refinedwebsolutions.com

## Links

- 🎮 Play online: https://refinedwebsolutions.com/caffeine-scramble
- 📦 F-Droid: (pending submission)
- 🐛 Report bugs: https://github.com/YOUR_USERNAME/caffeine-scramble/issues
