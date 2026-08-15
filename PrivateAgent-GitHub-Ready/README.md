# PrivateAgent — Admin + Agent Monorepo

This repository combines the two supplied Flutter projects into one GitHub-ready repository:

- `apps/agent` — the existing PrivateAgent Agent application (`private-agent-1.0.2`).
- `apps/admin` — the PrivateAgent Admin UI (`PrivateAgentAdmin-0.1.0`).
- `firebase` — shared Realtime Database and Storage rules/templates.
- `docs` — integration and repository notes.

## Architecture

```text
Admin App (apps/admin)
        |
        | authenticated commands / status
        v
Firebase Authentication
        |
        +---- Realtime Database ---- commands / agent state
        |
        +---- Cloud Storage -------- wallpapers / media
        |
        v
Agent App (apps/agent)
```

The Admin and Agent apps remain separate Flutter applications. They are intentionally not merged into one Flutter target because they have different roles and Android capabilities.

## Firebase project

The supplied Firebase project ID is:

`my-project-a03ee`

The Firebase web configuration supplied by the project owner is documented in `docs/FIREBASE_SETUP.md`. Firebase API keys/config identifiers are not treated as server secrets; do **not** commit service-account keys, private signing keys, or other privileged credentials.

## First-time setup

### 1. Install Flutter

Use a current stable Flutter SDK compatible with Dart 3.10.x or newer.

### 2. Agent

```bash
cd apps/agent
flutter pub get
flutter run
```

The Agent app keeps its existing Android Accessibility/native integration. Review its existing onboarding and Android permissions before enabling any device-management features.

### 3. Admin

```bash
cd apps/admin
flutter pub get
```

Register the Admin Android application in the Firebase project, then generate `lib/firebase_options.dart` with FlutterFire CLI:

```bash
flutterfire configure --project=my-project-a03ee
```

The generated `firebase_options.dart` is intentionally ignored by Git. Do not copy a service-account credential into the Flutter app.

After configuration:

```bash
flutter run
```

## Firebase rules

Deploy the supplied rules only after reviewing your authentication model:

```bash
firebase login
firebase use my-project-a03ee
firebase deploy --only database,storage
```

The rules assume:

- Admin users have an Authentication custom claim `admin: true`.
- Agent Authentication UID is the same value used as the `agentId` path.
- Agents can update their own state.
- Only Admin users can create commands.

If your production identity model differs, change the rules before deployment.

## Command model

Commands are written under:

`commands/<agentId>/<commandId>`

Example:

```json
{
  "type": "flashlight",
  "enabled": true,
  "durationMinutes": null,
  "value": null,
  "message": null,
  "createdAt": 0,
  "status": "pending"
}
```

Agent state is stored under:

`agents/<agentId>`

The Admin project already contains `FirebaseService.sendCommand()` as the integration point.

## Important security / platform notes

This repository is structured for authorized device management. Camera, microphone, location, screen sharing, phone calls, and lock/kiosk behavior must use Android permissions, user-visible indicators/consent where required, and appropriate Android Enterprise/Device Owner APIs when stronger device management is needed.

Do not implement covert monitoring, hidden camera/microphone/location collection, or attempts to defeat the device owner's physical power controls.

## GitHub push

From the repository root:

```bash
git init
git add .
git commit -m "Initial PrivateAgent Admin + Agent monorepo"
git branch -M main
git remote add origin https://github.com/<OWNER>/<REPOSITORY>.git
git push -u origin main
```

Replace `<OWNER>/<REPOSITORY>` with your own GitHub repository.
