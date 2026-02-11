[![banner](https://github.com/dev-cetera/df_safer_dart_annotations/blob/v0.2.2/doc/assets/banner.png?raw=true)](https://github.com/dev-cetera)

[![pub](https://img.shields.io/pub/v/df_safer_dart_annotations.svg)](https://pub.dev/packages/df_safer_dart_annotations)
[![tag](https://img.shields.io/badge/Tag-v0.2.2-purple?logo=github)](https://github.com/dev-cetera/df_safer_dart_annotations/tree/v0.2.2)
[![buymeacoffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-FFDD00?logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/dev_cetera)
[![sponsor](https://img.shields.io/badge/Sponsor-grey?logo=github-sponsors&logoColor=pink)](https://github.com/sponsors/dev-cetera)
[![patreon](https://img.shields.io/badge/Patreon-grey?logo=patreon)](https://www.patreon.com/robelator)
[![discord](https://img.shields.io/badge/Discord-5865F2?logo=discord&logoColor=white)](https://discord.gg/gEQ8y2nfyX)
[![instagram](https://img.shields.io/badge/Instagram-E4405F?logo=instagram&logoColor=white)](https://www.instagram.com/dev_cetera/)
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](https://raw.githubusercontent.com/dev-cetera/df_safer_dart_annotations/main/LICENSE)

---

<!-- BEGIN _README_CONTENT -->

## Summary

`df_safer_dart_annotations` provides annotations used by [df_safer_dart_lints](https://pub.dev/packages/df_safer_dart_lints) custom lint rules. These annotations help enforce safety patterns in your code.

## Available Annotations

| Annotation | Purpose |
|------------|---------|
| `@mustHandleReturn` | Warns when return value is ignored |
| `@mustHandleReturnOrError` | Errors when return value is ignored |
| `@noFutures` | Warns when Futures are used in annotated scope |
| `@noFuturesOrError` | Errors when Futures are used in annotated scope |
| `@mustBeAnonymous` | Warns when non-anonymous functions are used |
| `@mustBeStrongRef` | Warns when weak references are used |
| `@mustAwaitAllFutures` | Warns when Futures aren't awaited |
| `@UNSAFE` | Marks intentionally unsafe code blocks |

## Usage

```dart
import 'package:df_safer_dart_annotations/df_safer_dart_annotations.dart';

@mustHandleReturn
String whatIsYourName() {
  return 'Tony';
}

void main() {
  whatIsYourName(); // triggers a warning - return value not used!
  print(whatIsYourName()); // OK - return value is used
}
```

## Installation

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  df_safer_dart_annotations: any
  df_safer_dart_lints: any
  custom_lint: any
```

Enable in `analysis_options.yaml`:

```yaml
analyzer:
  plugins:
    - custom_lint
```

## Related Packages

- [df_safer_dart](https://pub.dev/packages/df_safer_dart) - Core safety types (Option, Result, Resolvable)
- [df_safer_dart_lints](https://pub.dev/packages/df_safer_dart_lints) - Lint rules that use these annotations


<!-- END _README_CONTENT -->

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
