import 'baseValidator.dart';

class LengthValidator extends BaseValidator {
  late int _min;
  late int _max;
  LengthValidator(String key, int min, int max)
      : super(key, "$key must be between $min and $max.") {
    _min = min;
    _max = max;
  }

  @override
  bool isValid(dynamic value) {
    return LengthValidator.length(value, _min, _max);
  }

  static bool length(String? value, min, max) {
    if (value != null) {
      return value.length >= min && value.length <= max;
    }
    return false;
  }
}
