[![pub](https://img.shields.io/pub/v/df_safer_dart_annotations.svg)](https://pub.dev/packages/df_safer_dart_annotations)
[![tag](https://img.shields.io/badge/Tag-v0.3.0-purple?logo=github)](https://github.com/dev-cetera/df_safer_dart_annotations/tree/v0.3.0)
[![buymeacoffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-FFDD00?logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/dev_cetera)
[![sponsor](https://img.shields.io/badge/Sponsor-grey?logo=github-sponsors&logoColor=pink)](https://github.com/sponsors/dev-cetera)
[![patreon](https://img.shields.io/badge/Patreon-grey?logo=patreon)](https://www.patreon.com/robelator)
[![discord](https://img.shields.io/badge/Discord-5865F2?logo=discord&logoColor=white)](https://discord.gg/gEQ8y2nfyX)
[![instagram](https://img.shields.io/badge/Instagram-E4405F?logo=instagram&logoColor=white)](https://www.instagram.com/dev_cetera/)
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](https://raw.githubusercontent.com/dev-cetera/df_safer_dart_annotations/main/LICENSE)

---

## Summary

`df_safer_dart_annotations` provides the **marker annotations** consumed by
the [`df_safer_dart_lints`](https://pub.dev/packages/df_safer_dart_lints)
plugin and re-exported by
[`df_safer_dart`](https://pub.dev/packages/df_safer_dart). This package has
no runtime behaviour — each annotation is an empty `const` class whose
*name* is what the lint plugin matches on.

Every annotation comes in two forms:

- the bare name (`@noFutures`, `@unsafe`, …) — reported by the analyzer as a
  **warning**, so existing code can migrate incrementally.
- the `*OrError` suffix (`@noFuturesOrError`, `@unsafeOrError`, …) — reported
  as an **error** that blocks the build.

## Annotations

| Annotation                  | Use it on…             | The lint stops… |
|-----------------------------|------------------------|-----------------|
| `@noFutures`                | functions / closures   | `async`, `await`, or any `Future`-typed expression inside the body |
| `@mustAwaitAllFutures`      | functions / closures   | Futures produced and then dropped as bare statements |
| `@mustBeAnonymous`          | function parameters    | callers passing a named function reference instead of an inline lambda |
| `@mustBeStrongRef`          | function parameters    | callers passing an inline function literal where a long-lived reference is required. Top-level functions, static methods, and instance-method tear-offs are accepted (weak-listener pattern) |
| `@mustHandleReturn`         | functions / methods    | callers discarding the return value |
| `@unsafe` / `@unsafeOrError`| functions / methods    | callers invoking unsafe API outside an `UNSAFE(() => ...)` block |
| `@experimental1/2/3`        | anything               | (informational — used by tooling to flag early-stage API) |

## Installation

```sh
dart pub add df_safer_dart_annotations
```

Most projects don't depend on this directly — they depend on `df_safer_dart`,
which re-exports it. Use this package directly only if you want the
annotations without pulling the full `Outcome` stack.

## Example

```dart
import 'package:df_safer_dart_annotations/df_safer_dart_annotations.dart';

@noFutures
int synchronousCalculation(int a, int b) {
  // Adding `await Future.delayed(...)` here would fire `no_futures`.
  return a + b;
}

@mustHandleReturnOrError
String whatIsYourName() => 'Tony';

void main() {
  // OK — return value used.
  final name = whatIsYourName();
  print(name);

  // Would fire `must_handle_return_or_error`:
  // whatIsYourName();
}
```

For the rule semantics see the
[`df_safer_dart_lints` README](https://pub.dev/packages/df_safer_dart_lints)
and its fixture suite. For the full `Outcome` / `Result` / `Resolvable`
ecosystem see
[`df_safer_dart`](https://pub.dev/packages/df_safer_dart).

---

🔍 For more information, refer to the [API reference](https://pub.dev/documentation/df_safer_dart_annotations/).

---

## 💬 Contributing and Discussions

This is an open-source project, and we warmly welcome contributions from everyone, regardless of experience level. Whether you're a seasoned developer or just starting out, contributing to this project is a fantastic way to learn, share your knowledge, and make a meaningful impact on the community.

### ☝️ Ways you can contribute

- **Find us on Discord:** Feel free to ask questions and engage with the community here: https://discord.gg/gEQ8y2nfyX.
- **Share your ideas:** Every perspective matters, and your ideas can spark innovation.
- **Help others:** Engage with other users by offering advice, solutions, or troubleshooting assistance.
- **Report bugs:** Help us identify and fix issues to make the project more robust.
- **Suggest improvements or new features:** Your ideas can help shape the future of the project.
- **Help clarify documentation:** Good documentation is key to accessibility. You can make it easier for others to get started by improving or expanding our documentation.
- **Write articles:** Share your knowledge by writing tutorials, guides, or blog posts about your experiences with the project. It's a great way to contribute and help others learn.

No matter how you choose to contribute, your involvement is greatly appreciated and valued!

### ☕ We drink a lot of coffee...

If you're enjoying this package and find it valuable, consider showing your appreciation with a small donation. Every bit helps in supporting future development. You can donate here: https://www.buymeacoffee.com/dev_cetera

<a href="https://www.buymeacoffee.com/dev_cetera" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" height="40"></a>

## LICENSE

This project is released under the [MIT License](https://raw.githubusercontent.com/dev-cetera/df_safer_dart_annotations/main/LICENSE). See [LICENSE](https://raw.githubusercontent.com/dev-cetera/df_safer_dart_annotations/main/LICENSE) for more information.
