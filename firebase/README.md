# Firebase layer

Recommended paths:
devices/{deviceId}
commands/{deviceId}/{commandId}
responses/{deviceId}/{commandId}

Each command should contain type, createdAt, expiresAt and payload.
Authenticate Admin and Agent separately and authorize each device before accepting commands.
Never place Firebase service-account private keys in the APK or browser.
