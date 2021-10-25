import 'baseValidator.dart';

class GreaterThanOrEqualToValidator extends BaseValidator {
  late int _max;
  GreaterThanOrEqualToValidator(String key, int max)
      : super(key, "$key must be greater than or equal to $max.") {
    _max = max;
  }

  @override
  bool isValid(dynamic value) {
    return GreaterThanOrEqualToValidator.greaterThanOrEqualTo(value, _max);
  }

  static bool greaterThanOrEqualTo(int value, max) {
    return value >= max;
  }
}
