// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login_email => 'E-mail';

  @override
  String get login_password => 'Password';

  @override
  String get register_first_name => 'First Name';

  @override
  String get register_last_name => 'Last Name';

  @override
  String get register_email => 'E-mail';

  @override
  String get register_password => 'Password';

  @override
  String get register_confirm_password => 'Confirm Password';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Please enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'At least 8 characters';

  @override
  String get passwordUpperCase => 'At least 1 uppercase letter';

  @override
  String get passwordLowerCase => 'At least 1 lowercase letter';

  @override
  String get passwordSymbol => 'At least 1 special character';

  @override
  String get firstNameRequired => 'Please enter your first name';

  @override
  String get lastNameRequired => 'Please enter your last name';

  @override
  String get passwordsDoNotMatch => 'Passwords must match';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get register => 'Register';

  @override
  String get logout => 'Logout';
}
