# PrivateAgent Admin

Flutter Admin UI prototype for authorized management of PrivateAgent devices.

## Included
- Dark blue/neon red Admin dashboard inspired by the supplied screenshot.
- Agent list and device details.
- Control cards for flashlight, video, wallpaper, lock and alert mode.
- Live cards for screen, camera, location and phone workflows.
- Firebase service layer for Realtime Database command dispatch.

## Firebase setup
1. Create/register an Android app for the Admin application in Firebase.
2. Install FlutterFire CLI and run `flutterfire configure` from this project.
3. Keep generated Firebase Android options in `lib/firebase_options.dart`.
4. Enable Authentication and Realtime Database.
5. Apply strict Firebase Security Rules; do not ship service-account secrets in the APK.

The Firebase values supplied by the project owner should be entered through the generated FlutterFire configuration rather than hard-coded into privileged code.

## Safety / Android constraints
This prototype intentionally does not implement covert surveillance, hidden microphone/camera access, bypassing the Android power button, or secret device lockout. Live access and device-control features should use Android permissions/enterprise device-management APIs with visible state and user authorization.

## Monorepo integration

This app is the Admin side of the PrivateAgent repository. The Agent application is located at `../../agent` in the repository layout when working from this folder's parent `apps/` directory.

Firebase wiring lives in `lib/services/firebase_service.dart`. Run FlutterFire configuration for the registered Admin Android application before enabling Firebase at runtime.
