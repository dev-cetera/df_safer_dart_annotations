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

import 'package:df_safer_dart_annotations/df_safer_dart_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('annotation constants resolve to the correct types', () {
    test('warn / error variants are distinct types', () {
      // Each "OrError" variant must NOT be the same runtime type as its
      // warning sibling — otherwise lint rules using TypeChecker cannot
      // tell them apart and the OrError severity is silently downgraded.
      expect(mustHandleReturn, isA<MustHandleReturnAnnotation>());
      expect(mustHandleReturn, isNot(isA<MustHandleReturnOrErrorAnnotation>()));
      expect(mustHandleReturnOrError, isA<MustHandleReturnOrErrorAnnotation>());
      expect(mustHandleReturnOrError, isNot(isA<MustHandleReturnAnnotation>()));

      expect(noFutures, isA<NoFuturesAnnotation>());
      expect(noFutures, isNot(isA<NoFuturesOrErrorAnnotation>()));
      expect(noFuturesOrError, isA<NoFuturesOrErrorAnnotation>());
      expect(noFuturesOrError, isNot(isA<NoFuturesAnnotation>()));

      expect(mustBeAnonymous, isA<MustBeAnonymousAnnotation>());
      expect(mustBeAnonymous, isNot(isA<MustBeAnonymousOrErrorAnnotation>()));
      expect(mustBeAnonymousOrError, isA<MustBeAnonymousOrErrorAnnotation>());
      expect(mustBeAnonymousOrError, isNot(isA<MustBeAnonymousAnnotation>()));

      expect(mustBeStrongRef, isA<MustBeStrongRefAnnotation>());
      expect(mustBeStrongRef, isNot(isA<MustBeStrongRefOrErrorAnnotation>()));
      expect(mustBeStrongRefOrError, isA<MustBeStrongRefOrErrorAnnotation>());
      expect(mustBeStrongRefOrError, isNot(isA<MustBeStrongRefAnnotation>()));

      expect(mustAwaitAllFutures, isA<MustAwaitAllFuturesAnnotation>());
      expect(
        mustAwaitAllFutures,
        isNot(isA<MustAwaitAllFuturesOrErrorAnnotation>()),
      );
      expect(
        mustAwaitAllFuturesOrError,
        isA<MustAwaitAllFuturesOrErrorAnnotation>(),
      );
      expect(
        mustAwaitAllFuturesOrError,
        isNot(isA<MustAwaitAllFuturesAnnotation>()),
      );

      expect(unsafe, isA<UnsafeAnnotation>());
      expect(unsafe, isNot(isA<UnsafeOrErrorAnnotation>()));
      expect(unsafeOrError, isA<UnsafeOrErrorAnnotation>());
      expect(unsafeOrError, isNot(isA<UnsafeAnnotation>()));
    });

    test('every annotation constant is non-null and const-constructible', () {
      // Smoke test: the const constructors must succeed, and the constants
      // must be reachable via the public export surface.
      expect(const MustHandleReturnAnnotation(), isNotNull);
      expect(const MustHandleReturnOrErrorAnnotation(), isNotNull);
      expect(const NoFuturesAnnotation(), isNotNull);
      expect(const NoFuturesOrErrorAnnotation(), isNotNull);
      expect(const MustBeAnonymousAnnotation(), isNotNull);
      expect(const MustBeAnonymousOrErrorAnnotation(), isNotNull);
      expect(const MustBeStrongRefAnnotation(), isNotNull);
      expect(const MustBeStrongRefOrErrorAnnotation(), isNotNull);
      expect(const MustAwaitAllFuturesAnnotation(), isNotNull);
      expect(const MustAwaitAllFuturesOrErrorAnnotation(), isNotNull);
      expect(const UnsafeAnnotation(), isNotNull);
      expect(const UnsafeOrErrorAnnotation(), isNotNull);
      expect(const ExperimentalAnnotation1(), isNotNull);
      expect(const ExperimentalAnnotation2(), isNotNull);
      expect(const ExperimentalAnnotation3(), isNotNull);
    });
  });
}
