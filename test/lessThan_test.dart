import 'package:fluent_validation_flutter/src/validators/LessThanValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when number is equal limit, is false', () {
    int actual = 127;
    int minLimit = 127;
    expect(LessThanValidator.lessThan(actual, minLimit), false);
  });

  test('when number is less than limit, is true', () {
    int actual = 999;
    int minLimit = 1999;
    expect(LessThanValidator.lessThan(actual, minLimit), true);
  });

  test('when number is greater than limit, is false', () {
    int actual = 450;
    int minLimit = 80;
    expect(LessThanValidator.lessThan(actual, minLimit), false);
  });
}
