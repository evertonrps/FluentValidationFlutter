import 'baseValidator.dart';

///A validator used to check if two inputs are not equal.
class NotEqualValidator extends BaseValidator {
  late Function _compareTo;
  String? _compareToField;

  NotEqualValidator(String key, Function compareTo, [String? compareToField])
      : super(key, "$key is not valid.") {
    _compareTo = compareTo;
    _compareToField = compareToField;
    if (_compareToField != null) {
      message = "$key must not equal $_compareToField.";
    }
  }

  @override
  bool isValid(dynamic value) {
    return notEqual(value, _compareTo);
  }

  static bool notEqual(dynamic a, Function b) {
    bool equal = a == b();
    return !equal;
  }
}
