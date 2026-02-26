# Lean SDK Flutter Example

This is a sample Flutter application demonstrating how to integrate and use the Lean SDK Flutter package. The example app showcases all major features of the Lean SDK, including bank account connection, payment source creation, reconnection, payments, and consent authorization.

## Overview

The example app provides a comprehensive demonstration of the Lean SDK Flutter integration, allowing you to:

- **Connect** bank accounts with customizable permissions
- **Reconnect** previously connected bank accounts
- **Create Payment Sources** (beneficiaries) for payments
- **Initiate Payments** with balance visibility options
- **Authorize Consent** for account access

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (version 1.17.0 or higher)
  - Check your Flutter version: `flutter --version`
  - Install Flutter: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

- **Dart SDK** (version 2.17.5 or higher, included with Flutter)

- **Platform-specific requirements:**
  - **iOS**: Xcode 12.0 or later, CocoaPods
  - **Android**: Android Studio, Android SDK (API level 21+), Java 17 or later

- **Lean SDK Account**: You'll need an app token from Lean Technologies to use the SDK

## Getting Started

### 1. Clone the Repository

If you haven't already, clone the repository:

```bash
git clone <repository-url>
cd link-sdk-flutter
```

### 2. Navigate to the Example Directory

```bash
cd example
```

### 3. Install Dependencies

Install Flutter dependencies:

```bash
flutter pub get
```

### 4. Platform-Specific Setup

#### iOS Setup

1. Navigate to the iOS directory:
   ```bash
   cd ios
   ```

2. Install CocoaPods dependencies:
   ```bash
   pod install
   ```

3. Return to the example directory:
   ```bash
   cd ..
   ```

**Note**: The iOS project requires:
- Camera permission (already configured in `Info.plist`)
- Network access permissions (already configured)
- Minimum iOS version: 12.0

#### Android Setup

The Android project is pre-configured with:
- Internet permission
- Camera permission
- Required queries for deep linking
- Minimum SDK version: 21
- Target SDK version: As specified by Flutter
- Java 17 compatibility

No additional setup is required for Android.

### 5. Configure Your App Token

Before running the app, you'll need to configure your Lean SDK app token. The example app includes input fields for this, but you can also hardcode it in `lib/main.dart` for testing:

1. Open `lib/main.dart`
2. Find the `appToken` variable (line 60)
3. Optionally set a default value:
   ```dart
   String appToken = "your-app-token-here";
   ```

**Important**: For production use, never hardcode sensitive tokens. Use environment variables or secure storage.

## Running the App

### Run on iOS Simulator/Device

```bash
flutter run -d ios
```

Or specify a specific device:
```bash
flutter devices  # List available devices
flutter run -d <device-id>
```

### Run on Android Emulator/Device

```bash
flutter run -d android
```

### Run on Specific Platform

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Linux (if configured)
flutter run -d linux
```

## Features Demonstrated

### 1. Connect Bank Account

Allows users to connect their bank account with customizable permissions:
- Identity
- Transactions
- Balance
- Accounts
- Payments

**Required Parameters:**
- Application Token
- Customer ID
- Bank Identifier (optional)
- Payment Destination ID (optional)

**Customization Options:**
- Button text color
- Theme color
- Button border radius
- Overlay color

### 2. Reconnect Bank Account

Reconnects a previously connected bank account using a reconnect ID.

**Required Parameters:**
- Application Token
- Reconnect ID

### 3. Create Payment Source

Creates a payment source (beneficiary) for future payments.

**Required Parameters:**
- Application Token
- Customer ID
- Payment Source ID
- Payment Destination ID

### 4. Pay

Initiates a payment with optional balance visibility.

**Required Parameters:**
- Application Token
- Account ID
- Payment Intent ID
- Show Balances (toggle)

### 5. Authorize Consent

Authorizes consent for account access with custom redirect URLs.

**Required Parameters:**
- Application Token
- Customer ID
- Consent ID
- Success Redirect URL
- Fail Redirect URL

## Project Structure

```
example/
├── lib/
│   └── main.dart          # Main application code with all SDK examples
├── android/                # Android-specific configuration
├── ios/                    # iOS-specific configuration
├── assets/
│   └── images/
│       └── lean.png        # Lean logo
├── pubspec.yaml           # Flutter dependencies
└── README.md              # This file
```

## Configuration Details

### Sandbox Mode

The example app runs in sandbox mode by default (`isSandbox: true`). To switch to production:

1. Open `lib/main.dart`
2. Find line 117: `var isSandbox = true;`
3. Change to: `var isSandbox = false;`

### Redirect URLs

The example app includes sample redirect URLs for success and failure callbacks. In production, you should:

1. Configure proper deep linking in your app
2. Update the redirect URLs to match your app's URL scheme
3. Handle the redirects appropriately in your routing configuration

The example uses `go_router` for navigation and includes routes for:
- `/app/flutter/connect/success`
- `/app/flutter/connect/fail`

### Permissions

The example app requests the following permissions by default:
- `LeanPermissions.identity`
- `LeanPermissions.transactions`
- `LeanPermissions.balance`
- `LeanPermissions.accounts`
- `LeanPermissions.payments`

You can modify these in `lib/main.dart` (lines 110-116).

## Troubleshooting

### iOS Issues

**Problem**: CocoaPods installation fails
- **Solution**: Run `cd ios && pod deintegrate && pod install && cd ..`

**Problem**: Build fails with signing errors
- **Solution**: Open `ios/Runner.xcworkspace` in Xcode and configure signing certificates

**Problem**: Camera permission not working
- **Solution**: Ensure `NSCameraUsageDescription` is set in `Info.plist` (already configured)

### Android Issues

**Problem**: Gradle build fails
- **Solution**: 
  - Ensure Java 17 is installed and configured
  - Run `cd android && ./gradlew clean && cd ..`
  - Try `flutter clean && flutter pub get`

**Problem**: App crashes on launch
- **Solution**: Check that all required permissions are in `AndroidManifest.xml` (already configured)

### General Issues

**Problem**: `flutter pub get` fails
- **Solution**: 
  - Ensure you're in the `example` directory
  - Check your internet connection
  - Try `flutter clean && flutter pub get`

**Problem**: SDK methods not working
- **Solution**: 
  - Verify your app token is correct
  - Check that you're using the correct sandbox/production environment
  - Ensure all required parameters are provided
  - Enable logs by setting `showLogs: true` (already enabled in the example)

**Problem**: Deep linking not working
- **Solution**: 
  - Verify redirect URLs are correctly configured
  - Check that routes are properly set up in `go_router`
  - Test with the sample URLs first before customizing

## Additional Resources

- [Lean SDK Flutter Documentation](../README.md)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Go Router Documentation](https://pub.dev/packages/go_router)

## Support

For issues related to:
- **This example app**: Open an issue in the repository
- **Lean SDK**: Contact Lean Technologies support
- **Flutter**: Check [Flutter's documentation](https://docs.flutter.dev/) or [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)

## License

This example app is provided as-is for demonstration purposes. Please refer to the main repository for license information.
