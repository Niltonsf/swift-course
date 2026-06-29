# Reminder

An iOS app built while studying the [Rocketseat Swift journey](https://app.rocketseat.com.br/jornada/swift/conteudos). It's a UIKit application written entirely in code (ViewCode — no Storyboards), using Firebase Authentication for login and `UserDefaults` for local persistence.

## Architecture

The project follows an **MVVM-C** approach (Model–View–ViewModel + Coordinator) with dependency injection:

- **Flow Controller / Coordinator** — [`ReminderFlowController`](Reminder/ReminderFlowController.swift) owns the `UINavigationController` and drives navigation between screens through delegate protocols (`SplashFlowDelegate`, `LoginBottomSheetFlowDelegate`).
- **Dependency Injection** — [`ViewControllersFactory`](Reminder/Sources/Features/DependecyInjection/ViewControllersFactory/ViewControllersFactory.swift) centralizes the creation of view controllers behind a protocol, keeping construction out of the flow logic.
- **Per-feature folders** — each feature groups its `View`, `ViewController`, `ViewModel`, and delegates together.

```
Reminder/
├── AppDelegate.swift            # Firebase configuration
├── SceneDelegate.swift          # Window + flow bootstrap
├── ReminderFlowController.swift  # Navigation coordinator
└── Sources/Features/
    ├── Splash/                  # Splash screen
    ├── LoginBottomSheet/        # Login UI + ViewModel (Firebase Auth)
    ├── Model/                   # User (Codable)
    ├── UserDefaults/            # UserDefaultsManager (persistence)
    ├── DependecyInjection/      # ViewControllersFactory
    ├── Constants/               # Colors, Metrics, Text
    └── Extensions/              # String / UITextField helpers
```

## Topics studied

- **ViewCode** — building UI programmatically with Auto Layout, no Storyboards.
- **MVVM-C** — separating navigation (Coordinator), presentation (ViewModel), and UI (View/ViewController).
- **Dependency Injection** via a factory protocol.
- **Firebase Authentication** — email/password sign-in in [`LoginBottomSheetViewModel`](Reminder/Sources/Features/LoginBottomSheet/ViewModel/LoginBottomSheetViewModel.swift).
- **Persistence** — encoding/decoding a `Codable` `User` into `UserDefaults` via [`UserDefaultsManager`](Reminder/Sources/Features/UserDefaults/UserDefaultsManager.swift).
- **Custom modal presentation** — animated bottom sheet (`overCurrentContext` + `crossDissolve`).
- **Organizing constants** — colors, metrics, and text strings in dedicated files.

## Requirements

- Xcode 15+
- [CocoaPods](https://cocoapods.org)
- A Firebase project (`GoogleService-Info.plist`)

## Getting started

1. Install the dependencies:
   ```bash
   pod install
   ```
2. Open the **workspace** (not the `.xcodeproj`):
   ```bash
   open Reminder.xcworkspace
   ```
3. Add your own Firebase config (see below).
4. Build and run on a simulator or device.

> ⚠️ **Firebase setup required.** `GoogleService-Info.plist` is **not committed** (it's git-ignored). Before building you must:
> 1. Create a project in the [Firebase Console](https://console.firebase.google.com) and register an iOS app.
> 2. Enable **Email/Password** under **Authentication → Sign-in method**.
> 3. Download `GoogleService-Info.plist` and place it at `Reminder/Reminder/GoogleService-Info.plist`.

## Dependencies

- [`Firebase/Auth`](https://firebase.google.com/docs/auth) — managed via CocoaPods.

## About

Learning project — part of my path through Rocketseat's Swift content.
