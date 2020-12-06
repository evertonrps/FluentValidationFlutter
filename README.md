# FluentValidationFlutter

A small Flutter package for building validation rules.

## Getting Started

This project was forked from [flutter_validate](https://pub.dev/packages/flutter_validate) (which has not been updated for a long time) and with some ideas from [fluent_validation](https://github.com/SKLn-Rad/Dart-Fluent-Validation), has been updated and added some changes to make it more like using FluentValidation .NET

### Simple Example
```dart
class CustomerValidator extends AbstractValidator<Customer> {
  CustomerValidator() {
    ruleFor("id", (customer) => customer.id).notNull();
    ruleFor("name", (customer) => customer.name).notEmpty();
    ruleFor("age", (customer) => customer.age).greaterThan(18);
  }
}

Customer customer = Customer();
CustomerValidator validator = new CustomerValidator();
validator.validate(customer);
bool isValid = validator.isValid();
List<String> errors = validator.allErrors;
```

### Complex Example
```dart
class CustomerValidator extends AbstractValidator<Customer> {
  CustomerValidator() {
    ruleFor("id", (customer) => customer.id)..notNull()..greaterThan(0);;
    ruleFor("name", (customer) => customer.name)
    ..notEmpty()..notEqual(() => "Squall");;
    ruleFor("age", (customer) => customer.age)
    ..greaterThan(18)..withMessage("Custom Message");
  }
}

Customer customer = Customer();
CustomerValidator validator = new CustomerValidator();
validator.validate(customer);
bool isValid = validator.isValid();
List<String> errors = validator.allErrors;
```

## Credits
Forked from [flutter_validate](https://github.com/jebright/flutter_validate) repo.
[fluent_validation](https://pub.dev/packages/fluent_validation_flutter) repo.
