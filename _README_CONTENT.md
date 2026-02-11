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
