import 'baseValidator.dart';

class NotEmptyValidator extends BaseValidator {
  NotEmptyValidator(String key) : super(key, "$key must be specified.");

  @override
  bool isValid(dynamic value) {
    return NotEmptyValidator.notEmpty(value);
  }

  static bool notEmpty(dynamic value) {
    return notNull(value) && notEmptyString(value);
  }

  static bool notNull(dynamic value) {
    return value != null;
  }

  static bool notEmptyString(dynamic value) {
    if (value is! String) return true;
    return (value).isNotEmpty;
  }
}
