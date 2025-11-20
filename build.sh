#!/bin/bash
# Build script for Caffeine Scramble APK

set -e

echo "================================"
echo "Caffeine Scramble APK Builder"
echo "================================"
echo ""

# Check for required tools
check_tool() {
    if ! command -v $1 &> /dev/null; then
        echo "❌ $1 not found. Please install it first."
        echo "See README.md for installation instructions."
        exit 1
    fi
    echo "✓ $1 found"
}

echo "Checking prerequisites..."
check_tool cordova
check_tool java
check_tool gradle

if [ -z "$ANDROID_HOME" ]; then
    echo "❌ ANDROID_HOME not set"
    echo "Please set ANDROID_HOME environment variable"
    exit 1
fi
echo "✓ ANDROID_HOME set to $ANDROID_HOME"
echo ""

# Build type
BUILD_TYPE=${1:-debug}

if [ "$BUILD_TYPE" = "release" ]; then
    echo "Building RELEASE APK..."
    cordova build android --release
    APK_PATH="platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk"
    echo ""
    echo "================================"
    echo "✓ Release APK built successfully!"
    echo "================================"
    echo "Location: $APK_PATH"
    echo ""
    echo "⚠️  This APK is UNSIGNED and cannot be installed."
    echo "To sign it for distribution:"
    echo ""
    echo "1. Generate a keystore (one-time):"
    echo "   keytool -genkey -v -keystore caffeine-scramble.keystore \\"
    echo "     -alias caffeine-scramble -keyalg RSA -keysize 2048 -validity 10000"
    echo ""
    echo "2. Sign the APK:"
    echo "   jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \\"
    echo "     -keystore caffeine-scramble.keystore $APK_PATH caffeine-scramble"
    echo ""
    echo "3. Align the APK:"
    echo "   zipalign -v 4 $APK_PATH caffeine-scramble-v1.0.0.apk"
else
    echo "Building DEBUG APK (for testing)..."
    cordova build android
    APK_PATH="platforms/android/app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    echo "================================"
    echo "✓ Debug APK built successfully!"
    echo "================================"
    echo "Location: $APK_PATH"
    echo ""
    echo "Install with:"
    echo "  adb install $APK_PATH"
    echo ""
    echo "Or copy to phone and install manually."
fi

echo ""
echo "File size: $(du -h $APK_PATH | cut -f1)"
echo ""
