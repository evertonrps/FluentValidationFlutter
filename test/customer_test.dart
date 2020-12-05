import 'package:flutter_test/flutter_test.dart';

import 'customer.dart';

void main() {
  test("test valid customer", () {
    // Arrange
    Customer client = Customer(id: 1, name: 'Full Name', age: 19);
    var expected = true;
    CustomerValidator validator = new CustomerValidator();
    // Act
    validator.validate(client);
    // Asset
    expect(validator.isValid(), expected);
  });

  test("test invalid customer", () {
    // Arrange
    var expected = false;
    CustomerValidator validator = new CustomerValidator();
    Customer client = Customer(id: 1, name: '', age: 19);
    // Act
    validator.validate(client);
    // Asset
    expect(validator.isValid(), expected);
  });

  test("test number of errors", () {
    // Arrange
    var expected = 2;
    CustomerValidator validator = new CustomerValidator();
    Customer client = Customer(id: null, name: '', age: 19);
    // Act
    validator.validate(client);
    // Asset
    expect(validator.allErros.length, expected);
  });

  test("test error message", () {
    // Arrange
    var expected = 'name must be specified.';
    CustomerValidator validator = new CustomerValidator();
    Customer client = Customer(id: 1, name: '', age: 19);
    // Act
    validator.validate(client);
    // Asset
    expect(validator.allErros.length, 1);
    expect(validator.allErros.first, expected);
  });

  test("test custom error message", () {
    // Arrange
    var expectedResult = false;
    var expectedMessage = 'Custom Message';
    CustomerValidator validator = new CustomerValidator();
    Customer client = Customer(id: 1, name: 'Full Name', age: 15);
    // Act

    validator.validate(client);
    // Asset
    expect(validator.isValid(), expectedResult);
    expect(validator.allErros.length, 1);
    expect(validator.allErros.first, expectedMessage);
  });

  test("test greater than 18", () {
    // Arrange
    var expected = true;
    CustomerValidator validator = new CustomerValidator();
    Customer client = Customer(id: 1, name: 'Full Name', age: 19);
    // Act

    validator.validate(client);
    // Asset
    expect(validator.isValid(), expected);
  });
}
