# Swift Fundamentals

My study project from the [Rocketseat Swift journey](https://app.rocketseat.com.br/jornada/swift/conteudos). It collects the code I wrote while learning the basics of the Swift language and a first taste of SwiftUI.

## What's inside

| Path | What it covers |
| --- | --- |
| [`tipos.playground`](tipos.playground/Contents.swift) | Core language fundamentals: variables vs. constants, types, classes, initializers, optionals, optional binding (`if let` / `guard let`), and methods. |
| [`playground.swiftpm`](playground.swiftpm) | A minimal SwiftUI app (Swift Playgrounds app project) — the classic "Hello, world!" screen with a `VStack`, an SF Symbol image, and a `Text` view. |

## Topics studied

- **Variables and constants** — `var` vs. `let` and when each one is appropriate.
- **Types** — explicit type annotations (`String`, `Int`).
- **Classes** — properties, custom `init`, default parameter values, and methods.
- **Optionals** — declaring optional properties (`Int?`) and safely unwrapping them with `if let` and `guard let`.
- **SwiftUI basics** — the `App` entry point, `Scene` / `WindowGroup`, and building a simple `View`.

## Requirements

- **Xcode 15+** (the project targets the Swift 6 toolchain) or **Swift Playgrounds** on Mac/iPad.
- iOS 16.0+ for the SwiftUI app target.

## How to run

### `tipos.playground`
Open it in Xcode and run it. The results show inline in the playground's sidebar and console.

```bash
open tipos.playground
```

### `playground.swiftpm`
Open it with Swift Playgrounds or Xcode and press **Run** to launch the app in the simulator.

```bash
open playground.swiftpm
```

## About

Learning project — part of my path through Rocketseat's Swift content. The code is intentionally simple and meant for practice and reference.
