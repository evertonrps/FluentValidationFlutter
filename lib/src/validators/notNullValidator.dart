import 'baseValidator.dart';

class NotNullValidator extends BaseValidator {
  NotNullValidator(String key) : super(key, "$key must not be null.");

  @override
  bool isValid(Object value) {
    return NotNullValidator.notNull(value);
  }

  static bool notNull(Object value) {
    return value != null;
  }
}
