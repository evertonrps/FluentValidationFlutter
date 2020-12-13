import 'baseValidator.dart';

class LessThanValidator extends BaseValidator {
  int _max;
  LessThanValidator(String key, int max)
      : super(key, "$key must be less than $max.") {
    _max = max;
  }

  @override
  bool isValid(Object value) {
    return LessThanValidator.lessThan(value, _max);
  }

  static bool lessThan(int value, max) {
    if (value == null) return false;
    return value < max;
  }
}
