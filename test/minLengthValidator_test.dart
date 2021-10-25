import 'package:fluent_validation_flutter/src/validators/minLengthValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when string a is greater than minimum, minLength called, is true', () {
    String a = 'Garnet Til Alexandros';
    expect(MinLengthValidator.minLength(a, 15), true);
  });

  test('when a name is equal than minimum, minLength called, is true', () {
    String a = 'Garnet Til Alexandros';
    expect(MinLengthValidator.minLength(a, 21), true);
  });

  test('when string a is less the mininum, minLength called, is false', () {
    String a = 'Garnet Til Alexandros';
    expect(MinLengthValidator.minLength(a, 30), false);
  });

  test('when a name is null, mininum called, does not throw', () {
    String? a;
    expect(MinLengthValidator.minLength(a, 10), false);
  });
}
