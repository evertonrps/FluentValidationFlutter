import 'baseValidator.dart';

class LessThanOrEqualToValidator extends BaseValidator {
  int _max;
  LessThanOrEqualToValidator(String key, int max)
      : super(key, "$key must be less than or equal to $max.") {
    _max = max;
  }

  @override
  bool isValid(Object value) {
    return LessThanOrEqualToValidator.lessThanOrEqualTo(value, _max);
  }

  static bool lessThanOrEqualTo(int value, max) {
    if (value == null) return false;
    return value <= max;
  }
}
