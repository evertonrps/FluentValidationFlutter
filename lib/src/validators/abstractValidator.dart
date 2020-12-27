import 'package:fluent_validation_flutter/src/ruleBuilder.dart';
import 'package:fluent_validation_flutter/src/ruleContainer.dart';
import 'package:fluent_validation_flutter/src/validationFailure.dart';
import 'package:fluent_validation_flutter/src/validationResult.dart';
import 'package:fluent_validation_flutter/src/validators/baseValidator.dart';

abstract class AbstractValidator<T> {
  T instance;
  Map<String, RuleContainer<T>> _rules;
  String errors;
  List<String> allErrors;

  //AbstractValidator(this.instance) {
  AbstractValidator() {
    //FYI - RuleContainer is just a list of validators that are 'assigned' to a particular property to validate.
    _rules = Map<String, RuleContainer<T>>();
    allErrors = [];
  }

  ///Create a container to hold rules for a property.  The value of the
  ///property should be returned by the passed in Function
  RuleBuilder ruleFor(String key, Function(T e) func) {
    var container = new RuleContainer<T>(func);
    _rules.putIfAbsent(key, () {
      return container;
    });
    return new RuleBuilder(key, container);
  }

  ///Validate all rules associated with the passed in key
  ValidationResult validateRuleFor(T object, String key) {
    var result = new ValidationResult();
    if (_rules.containsKey(key)) {
      dynamic value = _rules[key].getter(object);
      //Iterate each ValidationRule and invoke its validate method
      _rules[key].rules.forEach((BaseValidator r) {
        //Accumulate validation failures in order to create a validation result.
        var isValid = r.isValid(value);
        if (!isValid) {
          result.errors.add(new ValidationFailure()
            ..associatedWith = key
            ..errorMessage = r.message);
        }
      });
    }
    return result;
  }

  ///Validate all rules
  List<ValidationResult> validate(T object) {
    List<ValidationResult> result = [];
    _rules.forEach((key, container) {
      result.add(validateRuleFor(object, key));
    });
    errors = concatenatedErrors(result);
    getErrors(result);
    return result;
  }

  ///Returns all errors in a text format.  Errors are separated by delimiter (default is a space).
  ///IMPORTANT: Executing this method has the side-effect of also executing validate().
  String concatenatedErrors(List<ValidationResult> list) {
    //var lst = validate();
    String result = list.fold<String>('', (previous, element) {
      return element.errorText != null
          ? '$previous ${element.errorText}'
          : null;
    });
    if (result == null) return null;
    return result.trim();
  }

  getErrors(List<ValidationResult> list) {
    //var lst = validate();
    allErrors.clear();
    for (var item in list) {
      for (var e in item.errors) {
        allErrors.add(e.errorMessage.trim());
      }
    }

    // String result = list.fold<String>('', (previous, element) {
    //   return element.errorText != null
    //       ? '$previous ${element.errorText}'
    //       : null;
    // });
    // if (result == null) return null;
    // return result.trim();
  }

  bool isValid() {
    if (allErrors != null && allErrors.length > 0) {
      return false;
    } else {
      return true;
    }
  }
}
