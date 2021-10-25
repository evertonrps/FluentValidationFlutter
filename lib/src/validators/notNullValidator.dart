import 'baseValidator.dart';

class NotNullValidator extends BaseValidator {
  NotNullValidator(String key) : super(key, "$key must not be null.");

  @override
  bool isValid(dynamic value) {
    return NotNullValidator.notNull(value);
  }

  static bool notNull(dynamic value) {
    return value != null;
  }
}
