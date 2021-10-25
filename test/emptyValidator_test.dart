import 'package:fluent_validation_flutter/src/validators/emptyValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('null is passed, empty called, is true', () {
    expect(EmptyValidator.empty(null), true);
  });

  test('empty string is passed, empty called, is true', () {
    expect(EmptyValidator.empty(''), true);
  });

  test('empty string not null or empty is passed, empty called, is false', () {
    expect(EmptyValidator.empty('Vincent Valentine'), false);
  });

  test('empty int is passed, empty called, is true', () {
    int? i;
    expect(EmptyValidator.empty(i), true);
  });

  test('int of zero is passed, empty called, is true', () {
    int i = 0;
    expect(EmptyValidator.empty(i), true);
  });

  test('int is passed greater than zero, empty called, is false', () {
    int i = 7;
    expect(EmptyValidator.empty(i), false);
  });

  test('string of whitespace is passed, empty called, is false', () {
    String s = ' ';
    expect(EmptyValidator.empty(s), false);
  });
}
