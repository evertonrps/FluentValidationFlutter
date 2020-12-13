import 'package:fluent_validation_flutter/fluent_validation_flutter.dart';

class Contact {
  String name;
  DateTime dob;
  String contactPreference = "EMAIL"; //PHONE, EMAIL
  String phone;
  String email;
  String password;
}

class ContactValidator extends AbstractValidator<Contact> {}
