# Firebase setup

Project ID: `my-project-a03ee`

## Supplied Firebase configuration

The original configuration supplied for this project was:

```js
const firebaseConfig = {
  apiKey: "AIzaSyBa7zGD66GlRrJq5NzTxAPjb7nedvkEIhM",
  authDomain: "my-project-a03ee.firebaseapp.com",
  databaseURL: "https://my-project-a03ee-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "my-project-a03ee",
  storageBucket: "my-project-a03ee.firebasestorage.app",
  messagingSenderId: "615028260326",
  appId: "1:615028260326:web:e8bef3cffa668e0487aa27",
  measurementId: "G-LPRTC0DBN5"
};
```

This web configuration is not a substitute for registering the Android Admin application. Run FlutterFire for the Admin app so the generated Android options match the registered package/application.

## Authentication

Create at least two roles:

- Admin — Firebase Authentication user with custom claim `admin: true`.
- Agent — Firebase Authentication user whose UID is used as the Agent ID.

Do not put a Firebase service-account JSON file in either Flutter application.

## Realtime Database paths

```text
agents/<agentId>
commands/<agentId>/<commandId>
```

Suggested Agent state:

```json
{
  "name": "Agent 001",
  "model": "TECNO KI7",
  "android": "Android 13",
  "online": true,
  "battery": 82,
  "network": "Wi-Fi",
  "ip": "",
  "location": {
    "permission": true,
    "latitude": 0,
    "longitude": 0,
    "updatedAt": 0
  },
  "lastSeen": 0
}
```

## Storage

Use paths such as:

```text
wallpapers/<agentId>/<filename>
media/<agentId>/<filename>
```

Keep write access restricted to Admin users and read access restricted to the intended Agent.
