# PrivateAgent GitHub Build

This project is configured to build a debug APK with GitHub Actions.

Requirements:
- Java 17
- Android SDK 35
- Gradle 8.9

GitHub:
1. Push the repository to the `main` branch.
2. Open Actions.
3. Run `Build PrivateAgent APK`.
4. Download `PrivateAgent-debug-apk` from Artifacts.

The workflow installs Gradle 8.9 directly, so a local `gradlew` wrapper is not required.
