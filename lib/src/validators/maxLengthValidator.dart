import 'baseValidator.dart';

class MaxLengthValidator extends BaseValidator {
  late int _max;
  MaxLengthValidator(String key, int max)
      : super(key, "The length of $key must be $max characters or fewer") {
    _max = max;
  }

  @override
  bool isValid(dynamic value) {
    return MaxLengthValidator.maxLength(value, _max);
  }

  static bool maxLength(String? value, max) {
    if (value != null) {
      return value.length <= max;
    }
    return false;
  }
}
