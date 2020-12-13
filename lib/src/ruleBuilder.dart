//import 'package:fluent_validation_flutter/src/validators/dateValidator.dart';
import 'package:fluent_validation_flutter/src/validators/LessThanValidator.dart';
import 'package:fluent_validation_flutter/src/validators/equalValidator.dart';
import 'package:fluent_validation_flutter/src/validators/greaterThanOrEqualTo.dart';
import 'package:fluent_validation_flutter/src/validators/greaterThanValidator.dart';
import 'package:fluent_validation_flutter/src/validators/lengthValidator.dart';
import 'package:fluent_validation_flutter/src/validators/lessThanOrEqualTo.dart';
import 'package:fluent_validation_flutter/src/validators/mustValidator.dart';
import 'package:fluent_validation_flutter/src/validators/notNullValidator.dart';
import 'package:fluent_validation_flutter/src/validators/wrappingValidator.dart';
import 'package:fluent_validation_flutter/src/when.dart';
import './validators/notEmptyValidator.dart';
import './validators/notEqualValidator.dart';
import './validators/regExpValidator.dart';
import './ruleContainer.dart';

class RuleBuilder<T> {
  RuleContainer<T> _container;
  String _key;
  RuleBuilder(String key, RuleContainer<T> container) {
    _key = key;
    _container = container;
  }

  notEmpty() {
    var validator = new NotEmptyValidator(_key);
    _container.rules.add(validator);
  }

  notNull() {
    var validator = new NotNullValidator(_key);
    _container.rules.add(validator);
  }

  notEqual(Function compareTo, [String compareToField]) {
    var validator = new NotEqualValidator(_key, compareTo, compareToField);
    _container.rules.add(validator);
  }

  equal(Function compareTo, [String compareToField]) {
    var validator = new EqualValidator(_key, compareTo, compareToField);
    _container.rules.add(validator);
  }

  length(min, max) {
    var validator = new LengthValidator(_key, min, max);
    _container.rules.add(validator);
  }

  greaterThan(max) {
    var validator = new GreaterThanValidator(_key, max);
    _container.rules.add(validator);
  }

  greaterThanOrEqualTo(max) {
    var validator = new GreaterThanOrEqualToValidator(_key, max);
    _container.rules.add(validator);
  }

  lessThan(max) {
    var validator = new LessThanValidator(_key, max);
    _container.rules.add(validator);
  }

  lessThanOrEqualTo(max) {
    var validator = new LessThanOrEqualToValidator(_key, max);
    _container.rules.add(validator);
  }

  phoneNumber() {
    var validator = new RegExpValidator(_key, usPhoneMatcher);
    _container.rules.add(validator);
  }

  emailAddress() {
    var validator = new RegExpValidator(_key, emailMatcher);
    _container.rules.add(validator);
  }

  matches(String regex) {
    var validator = new RegExpValidator(_key, regex);
    _container.rules.add(validator);
  }

  must<T>(MustPredicate<T> p) {
    var validator = new MustValidator<T>(_key, p);
    _container.rules.add(validator);
  }

  withMessage(String message) {
    var rule = _container.rules.last;
    rule.message = message;
  }

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
