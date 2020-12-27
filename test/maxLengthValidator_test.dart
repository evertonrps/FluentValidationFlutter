import 'package:fluent_validation_flutter/src/validators/maxLengthValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when string a is less than limit, maxLength called, is true', () {
    String a = 'Zidane Tribal';
    expect(MaxLengthValidator.maxLength(a, 15), true);
  });

  test('when a name is equal limit, maxLength called, is true', () {
    String a = 'Zidane Tribal';
    expect(MaxLengthValidator.maxLength(a, 13), true);
  });

  test('when string a is over max limit, maxLength called, is false', () {
    String a = 'Zidane Tribal';
    expect(MaxLengthValidator.maxLength(a, 10), false);
  });

  test('when a name is null, maxLength called, does not throw', () {
    String a;
    expect(MaxLengthValidator.maxLength(a, 10), false);
  });
}
