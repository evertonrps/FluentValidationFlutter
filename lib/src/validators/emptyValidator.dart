import 'baseValidator.dart';

class EmptyValidator extends BaseValidator {
  EmptyValidator(String key) : super(key, "$key must be empty.");

  @override
  bool isValid(dynamic value) {
    return EmptyValidator.empty(value);
  }

  static bool empty(dynamic value) {
    return notNull(value) || defaultValue(value);
  }

  static bool notNull(dynamic value) {
    return value == null;
  }

  static bool defaultValue(Object value) {
    if (value is num) return value.toString() == '0';
    return (value as String).isEmpty;
  }
}
