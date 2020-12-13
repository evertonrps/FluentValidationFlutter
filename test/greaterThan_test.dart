import 'package:fluent_validation_flutter/src/validators/greaterThanValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when number is equal limit, is false', () {
    int actual = 127;
    int minLimit = 127;
    expect(GreaterThanValidator.greaterThan(actual, minLimit), false);
  });

  test('when number is greater than limit, is true', () {
    int actual = 1000;
    int minLimit = 999;
    expect(GreaterThanValidator.greaterThan(actual, minLimit), true);
  });

  test('when number is less than limit, is false', () {
    int actual = 45;
    int minLimit = 380;
    expect(GreaterThanValidator.greaterThan(actual, minLimit), false);
  });
}
