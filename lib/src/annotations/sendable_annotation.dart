//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

/// Marks a parameter whose value must be sendable through `SendPort`. Function
/// arguments must be a top-level function or a static method reference —
/// closures and instance-method tear-offs are rejected because Dart's isolate
/// runtime cannot copy them.
const sendable = SendableAnnotation();

/// The class that enables the @[sendable] annotation.
final class SendableAnnotation {
  const SendableAnnotation();
}

/// Like @[sendable] but the lint fires as an error rather than a warning.
const sendableOrError = SendableOrErrorAnnotation();

/// The class that enables the @[sendableOrError] annotation.
final class SendableOrErrorAnnotation {
  const SendableOrErrorAnnotation();
}
