import 'package:flutter_test/flutter_test.dart';
import 'package:meditationapp/screens/authenticate/sign_in.dart';

void main() {

  test('empty email returns error string', () {

    var result = EmailFieldValidator.validate('');
    expect(result, 'Please enter a valid email');
  });

  test('non-empty email returns null', () {

    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('empty password returns error string', () {

    var result = PasswordFieldValidator.validate('');
    expect(result, 'Enter a strong password (6+ characters)');
  });

  test('non-empty password returns null', () {

    var result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}