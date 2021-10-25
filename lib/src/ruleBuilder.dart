//import 'package:fluent_validation_flutter/src/validators/dateValidator.dart';
import 'package:fluent_validation_flutter/src/validators/LessThanValidator.dart';
import 'package:fluent_validation_flutter/src/validators/emptyValidator.dart';
import 'package:fluent_validation_flutter/src/validators/equalValidator.dart';
import 'package:fluent_validation_flutter/src/validators/greaterThanOrEqualTo.dart';
import 'package:fluent_validation_flutter/src/validators/greaterThanValidator.dart';
import 'package:fluent_validation_flutter/src/validators/lengthValidator.dart';
import 'package:fluent_validation_flutter/src/validators/lessThanOrEqualTo.dart';
import 'package:fluent_validation_flutter/src/validators/maxLengthValidator.dart';
import 'package:fluent_validation_flutter/src/validators/minLengthValidator.dart';
import 'package:fluent_validation_flutter/src/validators/mustValidator.dart';
import 'package:fluent_validation_flutter/src/validators/notNullValidator.dart';
import 'package:fluent_validation_flutter/src/validators/wrappingValidator.dart';
import 'package:fluent_validation_flutter/src/when.dart';
import './validators/notEmptyValidator.dart';
import './validators/notEqualValidator.dart';
import './validators/regExpValidator.dart';
import './ruleContainer.dart';

class RuleBuilder<T> {
  late RuleContainer<T> _container;
  late String _key;
  RuleBuilder(String key, RuleContainer<T> container) {
    _key = key;
    _container = container;
  }

  ///Return true if property not null
  notNull() {
    var validator = new NotNullValidator(_key);
    _container.rules.add(validator);
  }

  /// Returns true if property not empty
  notEmpty() {
    var validator = new NotEmptyValidator(_key);
    _container.rules.add(validator);
  }

  ///Returns true if property is not equal to compared value
  notEqual(Function compareTo, [String? compareToField]) {
    var validator = new NotEqualValidator(_key, compareTo, compareToField);
    _container.rules.add(validator);
  }

  ///Returns true if property is equal to compared value
  equal(Function compareTo, [String? compareToField]) {
    var validator = new EqualValidator(_key, compareTo, compareToField);
    _container.rules.add(validator);
  }

  ///Returns true if property between min and max value
  length(min, max) {
    var validator = new LengthValidator(_key, min, max);
    _container.rules.add(validator);
  }

  ///Returns true if property has length less than max value
  maxLength(max) {
    var validator = new MaxLengthValidator(_key, max);
    _container.rules.add(validator);
  }

  ///Returns true if property has length is greater than min value
  minLength(min) {
    var validator = new MinLengthValidator(_key, min);
    _container.rules.add(validator);
  }

  ///Returns true if property has value lesss than max value
  lessThan(max) {
    var validator = new LessThanValidator(_key, max);
    _container.rules.add(validator);
  }

  ///Returns true if property has value less or equal than max value
  lessThanOrEqualTo(max) {
    var validator = new LessThanOrEqualToValidator(_key, max);
    _container.rules.add(validator);
  }

  ///Returns true if property has value greater than max value
  greaterThan(max) {
    var validator = new GreaterThanValidator(_key, max);
    _container.rules.add(validator);
  }

  ///Returns true if property has value greater or equal than max value
  greaterThanOrEqualTo(max) {
    var validator = new GreaterThanOrEqualToValidator(_key, max);
    _container.rules.add(validator);
  }

  ///Returns true if the property satisfies the condition
  matches(String regex) {
    var validator = new RegExpValidator(_key, regex);
    _container.rules.add(validator);
  }

  ///Returns true if the property satisfies the condition
  must<T>(MustPredicate<T> p) {
    var validator = new MustValidator<T>(_key, p);
    _container.rules.add(validator);
  }

  ///Returns true if the property has empty value
  empty() {
    var validator = new EmptyValidator(_key);
    _container.rules.add(validator);
  }

  ///Returns true if the property has a valid e-mail adress
  emailAddress() {
    var validator = new RegExpValidator(_key, emailMatcher);
    _container.rules.add(validator);
  }

  ///Returns true if the property has a valid phone number
  phoneNumber() {
    var validator = new RegExpValidator(_key, usPhoneMatcher);
    _container.rules.add(validator);
  }

  ///Show a custom message from validation
  withMessage(String message) {
    var rule = _container.rules.last;
    rule.message = message;
  }

  ///Returns true if the property satisfies the condition
  when(WhenPredicate predicate) {
    _container.rules.forEach((f) {
      var validator = new WrappingValidator(predicate, f);
      var index = _container.rules.indexOf(f);
      if (index > -1) {
        _container.rules[index] = validator;
      }
    });
  }
}
