import 'baseValidator.dart';

class GreaterThanValidator extends BaseValidator {
  late int _max;
  GreaterThanValidator(String key, int max)
      : super(key, "$key must be greater than $max.") {
    _max = max;
  }

  @override
  bool isValid(dynamic value) {
    return GreaterThanValidator.greaterThan(value, _max);
  }

  static bool greaterThan(int value, max) {
    return value > max;
  }
}
