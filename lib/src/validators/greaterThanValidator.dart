import 'baseValidator.dart';

class GreaterThanValidator extends BaseValidator {
  int _max;
  GreaterThanValidator(String key, int max)
      : super(key, "$key must be greater than $max.") {
    _max = max;
  }

  @override
  bool isValid(Object value) {
    return GreaterThanValidator.greaterThan(value, _max);
  }

  static bool greaterThan(int value, max) {
    if (value == null) return false;
    return value > max;
  }
}
