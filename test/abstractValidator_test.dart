import 'package:flutter_test/flutter_test.dart';
import 'contact.dart';

void main() {
  Contact contact;
  ContactValidator myValidator;

  setUp(() async {
    contact = new Contact();
    myValidator = new ContactValidator();
    myValidator.validate(contact);
  });

  test(
      'when notEmpty called, name is null and withMessage not used, returns default message',
      () {
    myValidator.ruleFor("Name", (contact) => contact.name)..notEmpty();
    var validationResults = myValidator.validateRuleFor(contact, "Name");
    expect(validationResults.errors[0].errorMessage, "Name must be specified.");
  });

  test(
      'when chaining validators notEmpty & notEqual, name supplied and not equal, has 0 errors',
      () {
    contact.name = 'joe';
    myValidator.ruleFor("name", (contact) => contact.name)
      ..notEmpty()
      ..withMessage("Name should not be empty")
      ..notEqual(() => "frank")
      ..withMessage("name should not equal frank");
    var validationResults = myValidator.validateRuleFor(contact, "name");
    expect(validationResults.errors.isEmpty, true);
  });

  test(
      'when chaining validators notEmpty & notEqual, name empty and not equal, has 1 error with proper message',
      () {
    contact.name = '';
    myValidator.ruleFor("name", (contact) => contact.name)
      ..notEmpty()
      ..withMessage("name is required!")
      ..notEqual(() => "frank")
      ..withMessage("name should not equal frank");
    var validationResults = myValidator.validateRuleFor(contact, "name");
    expect(validationResults.errors.length, 1);
    expect(validationResults.errors[0].errorMessage, "name is required!");
  });

  test(
      'when chaining validators notEqual & length & using errorText, not equal and length both fail, errorText has 2 errors separated by space',
      () {
    contact.name = 'admin';
    myValidator.ruleFor("name", (contact) => contact.name)
      ..notEqual(() => 'admin', 'admin')
      ..length(6, 10);
    var errorText = myValidator.validateRuleFor(contact, "name").errorText;
    expect(errorText != null, true);
    expect(
        errorText, "name must not equal admin. name must be between 6 and 10.");
  });

  test(
      'validate all, when 4 errors on 3 properites, has correct validation results and messages',
      () {
    contact.phone = '123';
    contact.password = 'password';
    myValidator.ruleFor('name', (contact) => contact.name)..notEmpty();
    myValidator.ruleFor('phone', (contact) => contact.phone)..phoneNumber();
    myValidator.ruleFor('password', (contact) => contact.password)
      ..length(16, 16)
      ..notEqual(() => 'password');

    var validationResults = myValidator.validate(contact);
    var totalErrorMessages =
        validationResults.fold<int>(0, (previous, element) {
      //print('Error found: ${element.errorText}');
      return previous + element.errors.length;
    });
    expect(validationResults.length, 3, reason: '3 fields, 3 sets of results');
    expect(totalErrorMessages, 4, reason: '3 fields, 4 validations in total');
  });

  test('all error test, when 4 errors, shows correct error text', () {
    contact.phone = '123';
    contact.password = 'password';
    myValidator.ruleFor('name', (contact) => contact.name)..notEmpty();
    myValidator.ruleFor('phone', (contact) => contact.phone)..phoneNumber();
    myValidator.ruleFor('password', (contact) => contact.password)
      ..length(16, 16)
      ..notEqual(() => 'password');

    myValidator.validate(contact);
    var allErrors = myValidator.allErrors;
    expect(allErrors.contains('name must be specified.'), true);
    expect(allErrors.contains('phone is not valid.'), true);
    expect(allErrors.contains('password must be between 16 and 16.'), true);
    expect(allErrors.contains('password is not valid.'), true);
  });

  test('when using must validator, condition passes as true, errors are empty',
      () {
    var nameMustNotBeFred = (String value) {
      return value != 'fred';
    };

    contact.name = 'joe';

    myValidator.ruleFor('name', (contact) => contact.name)
      ..must<String>(nameMustNotBeFred);
    myValidator.validate(contact);
    var allErrors = myValidator.allErrors;
    expect(allErrors.length, 0);
  });

  test(
      'when using must validator, condition fails as false, error correctly populated',
      () {
    var nameMustNotBeFred = (String value) {
      return value != 'fred';
    };

    contact.name = 'fred';

    myValidator.ruleFor('name', (contact) => contact.name)
      ..must<String>(nameMustNotBeFred);
    myValidator.validate(contact);
    var allErrors = myValidator.allErrors;
    expect(allErrors.contains('name is not valid.'), true);
  });
}
