import 'baseValidator.dart';

class LessThanValidator extends BaseValidator {
  late int _max;
  LessThanValidator(String key, int max)
      : super(key, "$key must be less than $max.") {
    _max = max;
  }

  @override
  bool isValid(dynamic value) {
    return LessThanValidator.lessThan(value, _max);
  }

  static bool lessThan(int value, max) {
    return value < max;
  }
}
