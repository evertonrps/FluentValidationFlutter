import 'baseValidator.dart';

class EmptyValidator extends BaseValidator {
  EmptyValidator(String key) : super(key, "$key must be empty.");

  @override
  bool isValid(Object value) {
    return EmptyValidator.empty(value);
  }

  static bool empty(Object value) {
    return notNull(value) || defaultValue(value);
  }

  static bool notNull(Object value) {
    return value == null;
  }

  static bool defaultValue(Object value) {
    if (value is num) return value.toString() == '0';
    return (value as String).isEmpty;
  }
}
