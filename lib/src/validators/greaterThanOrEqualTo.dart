import 'baseValidator.dart';

class GreaterThanOrEqualToValidator extends BaseValidator {
  int _max;
  GreaterThanOrEqualToValidator(String key, int max)
      : super(key, "$key must be greater than or equal to $max.") {
    _max = max;
  }

  @override
  bool isValid(Object value) {
    return GreaterThanOrEqualToValidator.greaterThanOrEqualTo(value, _max);
  }

  static bool greaterThanOrEqualTo(int value, max) {
    if (value == null) return false;
    return value >= max;
  }
}
