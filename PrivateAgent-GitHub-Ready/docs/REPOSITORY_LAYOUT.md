# Repository layout

```text
PrivateAgent/
├── apps/
│   ├── agent/        # Existing private-agent-1.0.2 project
│   └── admin/        # PrivateAgentAdmin-0.1.0 project
├── firebase/
│   ├── .firebaserc
│   ├── firebase.json
│   ├── database.rules.json
│   └── storage.rules
├── docs/
├── .gitignore
└── README.md
```

The original application code is preserved under `apps/agent` and `apps/admin`. No source files were blindly mixed together, which avoids package-name, Android manifest, and Gradle conflicts.
