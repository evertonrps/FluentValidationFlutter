import '../message.dart';

abstract class BaseValidator with Message {
  String _key;

  BaseValidator(this._key, String defaultErrorMessage) {
    message = defaultErrorMessage;
  }

  String get key {
    return _key;
  }

  bool isValid(dynamic value) {
    return false;
  }
}
