import 'package:fluent_validation_flutter/fluent_validation_flutter.dart';

void main() {
  var entity = Customer(id: 1, name: 'Tifa Lockhart', age: 25);
  if (entity.isValid()) {
    print('saved!');
  } else {
    print('sorry!');
  }
}

abstract class Entity<T> extends BaseValidator {}

class BaseValidator {
  List<String> _errors = new List<String>();
  List<String> get errors => _errors;
  BaseValidator();

  void validateNow<T>(AbstractValidator<T> validator, T instance) {
    validator.validate(instance);
    _errors = validator.allErrors;
  }

  bool isValid() {
    if (_errors.length > 0) {
      return false;
    } else {
      return true;
    }
  }
}

class Customer extends Entity<Customer> {
  int id;
  String name;
  int age;

  factory Customer({int id, String name, int age}) {
    var customer = Customer._(id: id, name: name, age: age);
    customer.validateNow(CustomerValidator(), customer);
    return customer;
  }

  Customer._({this.id, this.name, this.age});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}

class CustomerValidator extends AbstractValidator<Customer> {
  CustomerValidator() {
    ruleFor("id", (customer) => customer.id).notNull();
    ruleFor("name", (customer) => customer.name)
      ..notEmpty()
      ..maxLength(13);
    ruleFor("age", (customer) => customer.age)
      ..greaterThan(18)
      ..withMessage("Custom Message");
  }
}
