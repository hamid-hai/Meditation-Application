import 'package:flutter_test/flutter_test.dart';
import 'package:meditationapp/screens/authenticate/register.dart';


void main() {

  test('empty email returns error string', () {

    var result = EmailFieldValidatorRegister.validate('');
    expect(result, 'Please enter a valid email');
  });

  test('non-empty email returns null', () {

    var result = EmailFieldValidatorRegister.validate('email');
    expect(result, null);
  });

  test('empty password returns error string', () {

    var result = PasswordFieldValidatorRegister.validate('');
    expect(result, 'Enter a strong password (6+ characters)');
  });

  test('non-empty password returns null', () {

    var result = PasswordFieldValidatorRegister.validate('password');
    expect(result, null);
  });
}