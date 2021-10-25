import 'package:fluent_validation_flutter/src/validators/equalValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when strings a == b, equal called, is true', () {
    String a = 'a';
    Function b = () => 'a';
    expect(EqualValidator.equal(a, b), true);
  });

  test('when strings a != b, equal called, is false', () {
    String a = 'a';
    Function b = () => 'b';
    expect(EqualValidator.equal(a, b), false);
  });

  test('when int a == b, equal called, is true', () {
    int a = 1;
    Function b = () => 1;
    expect(EqualValidator.equal(a, b), true);
  });

  test('when int a != b, equal called, is false', () {
    int a = 1;
    Function b = () => 2;
    expect(EqualValidator.equal(a, b), false);
  });

  test('when Ojbect a == b, equal called, is true', () {
    Object a = new Object();
    Function b = () => a;
    expect(EqualValidator.equal(a, b), true);
  });

  test('when Object a != b, equal called, is false', () {
    Object a = new Object();
    Function b = () => new Object();
    expect(EqualValidator.equal(a, b), false);
  });
}
