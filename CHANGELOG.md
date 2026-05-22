# Changelog

## 0.3.0

- **fix**: `mustHandleReturnOrError` now refers to the dedicated
  `MustHandleReturnOrErrorAnnotation` class (it was previously aliased to
  `MustHandleReturnAnnotation`). The `df_safer_dart_lints` plugin matches
  annotations by class name, so the warning and error variants used to be
  indistinguishable — `@mustHandleReturnOrError` callsites were being
  picked up by the warning-level rule instead of the error-level one. Both
  variants now fire under their intended severity.
