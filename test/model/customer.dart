import 'package:fluent_validation_flutter/fluent_validation_flutter.dart';

class Customer {
  int? id;
  String? name;
  int? age;

  Customer({this.id, this.name, this.age});

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
    ruleFor("name", (customer) => customer.name).notEmpty();
    ruleFor("age", (customer) => customer.age)
      ..greaterThan(18)
      ..withMessage("Custom Message");
  }
}
