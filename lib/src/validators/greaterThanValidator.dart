import 'baseValidator.dart';

class GreaterThanValidator extends BaseValidator {
  int _max;
  GreaterThanValidator(String key, int max)
      : super(key, "$key must be greater than $max.") {
    _max = max;
  }

  @override
  bool isValid(Object value) {
    return GreaterThanValidator.length(value, _max);
  }

  static bool length(int value, max) {
    if (value == null) return false;
    return value > max;
  }
}
