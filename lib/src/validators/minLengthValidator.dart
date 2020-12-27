import 'baseValidator.dart';

class MinLengthValidator extends BaseValidator {
  int _min;
  MinLengthValidator(String key, int min)
      : super(key, "The length of $key must be at least $min characters") {
    _min = min;
  }

  @override
  bool isValid(Object value) {
    return MinLengthValidator.minLength(value, _min);
  }

  static bool minLength(String value, min) {
    if (value == null) return false;
    return value.length >= min;
  }
}
