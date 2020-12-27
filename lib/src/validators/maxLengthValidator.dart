import 'baseValidator.dart';

class MaxLengthValidator extends BaseValidator {
  int _max;
  MaxLengthValidator(String key, int max)
      : super(key, "The length of $key must be $max characters or fewer") {
    _max = max;
  }

  @override
  bool isValid(Object value) {
    return MaxLengthValidator.maxLength(value, _max);
  }

  static bool maxLength(String value, max) {
    if (value == null) return false;
    return value.length <= max;
  }
}
