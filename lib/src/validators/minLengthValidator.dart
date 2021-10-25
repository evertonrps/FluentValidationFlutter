import 'baseValidator.dart';

class MinLengthValidator extends BaseValidator {
  late int _min;
  MinLengthValidator(String key, int min)
      : super(key, "The length of $key must be at least $min characters") {
    _min = min;
  }

  @override
  bool isValid(dynamic value) {
    return MinLengthValidator.minLength(value, _min);
  }

  static bool minLength(String? value, min) {
    if (value != null) {
      return value.length >= min;
    }
    return false;
  }
}
