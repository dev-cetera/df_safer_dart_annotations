// This example demonstrates df_safer_dart_annotations.
// These annotations work with df_safer_dart_lints to enforce safety patterns.

// ignore_for_file: avoid_print, unused_local_variable

import 'package:df_safer_dart_annotations/df_safer_dart_annotations.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Example 1: @mustHandleReturn
///
/// This annotation warns when the return value is ignored.
/// Use it for functions whose return value should not be discarded.
@mustHandleReturn
String whatIsYourName() {
  return 'Tony';
}

/// Example 2: @mustHandleReturnOrError (stricter - triggers error)
@mustHandleReturnOrError
int calculateImportantValue() {
  return 42;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Example 3: @noFutures
///
/// This annotation ensures no Futures are used in the function body.
/// Useful for code that must be synchronous.
@noFutures
int synchronousCalculation(int a, int b) {
  // await Future.delayed(Duration(seconds: 1)); // Would trigger warning!
  return a + b;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Example 4: @mustBeStrongRef
///
/// This annotation ensures a strong reference is passed (not an anonymous function).
/// Used by df_pod for weak listener patterns.
void addListener({@mustBeStrongRef required void Function() listener}) {
  // The listener should be a variable, not an anonymous function,
  // so it can be garbage collected when the variable goes out of scope.
  listener();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void main() {
  // --- @mustHandleReturn example ---
  print('--- @mustHandleReturn ---');

  // This triggers a warning because return value is ignored:
  // whatIsYourName();  // ⚠️ Warning!

  // Correct usage - use the return value:
  final name = whatIsYourName();
  print('Name: $name'); // ✅ OK

  // --- @mustHandleReturnOrError example ---
  print('\n--- @mustHandleReturnOrError ---');

  // This triggers an ERROR because return value is ignored:
  // calculateImportantValue();  // ❌ Error!

  // Correct usage:
  final value = calculateImportantValue();
  print('Value: $value'); // ✅ OK

  // --- @noFutures example ---
  print('\n--- @noFutures ---');
  final sum = synchronousCalculation(10, 20);
  print('Sum: $sum'); // ✅ OK - no async code used

  // --- @mustBeStrongRef example ---
  print('\n--- @mustBeStrongRef ---');

  // This triggers a warning because an anonymous function is passed:
  // addListener(listener: () => print('Clicked!')); // ⚠️ Warning!

  // Correct usage - pass a variable:
  final myListener = () => print('Listener called!');
  addListener(listener: myListener); // ✅ OK

  print('\n=== Example Complete ===');
}
