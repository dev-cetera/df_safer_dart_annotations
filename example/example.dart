import 'package:df_safer_dart_annotations/df_safer_dart_annotations.dart';

// ignore: deprecated_member_use_from_same_package
@mustHandleReturn
String whatIsYourName() {
  return 'Tony';
}

void main() {
  whatIsYourName(); // triggers a warning!
  print(whatIsYourName());
}
