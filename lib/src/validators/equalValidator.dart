import 'baseValidator.dart';

///A validator used to check if two inputs are equal.
class EqualValidator extends BaseValidator {
  late Function _compareTo;
  String? _compareToField;

  EqualValidator(String key, Function compareTo, [String? compareToField])
      : super(key, "$key is not valid") {
    _compareTo = compareTo;
    _compareToField = compareToField;
    if (_compareToField != null) {
      message = "$key must equal $_compareToField.";
    }
  }

  @override
  bool isValid(dynamic value) {
    return equal(value, _compareTo);
  }

  static bool equal(dynamic a, Function b) {
    bool equal = a == b();
    return equal;
  }
}
