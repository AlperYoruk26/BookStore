// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get login_email => 'E-Mail';

  @override
  String get login_password => 'Passwort';

  @override
  String get register_first_name => 'Vorname';

  @override
  String get register_last_name => 'Nachname';

  @override
  String get register_email => 'E-Mail';

  @override
  String get register_password => 'Passwort';

  @override
  String get register_confirm_password => 'Passwort bestätigen';

  @override
  String get emailRequired => 'E-Mail ist erforderlich';

  @override
  String get emailInvalid => 'Bitte eine gültige E-Mail-Adresse eingeben';

  @override
  String get passwordRequired => 'Passwort ist erforderlich';

  @override
  String get passwordMinLength => 'Mindestens 8 Zeichen';

  @override
  String get passwordUpperCase => 'Mindestens 1 Großbuchstabe';

  @override
  String get passwordLowerCase => 'Mindestens 1 Kleinbuchstabe';

  @override
  String get passwordSymbol => 'Mindestens 1 Symbol';

  @override
  String get firstNameRequired => 'Bitte geben Sie Ihren Vornamen ein';

  @override
  String get lastNameRequired => 'Bitte geben Sie Ihren Nachnamen ein';

  @override
  String get passwordsDoNotMatch => 'Passwörter müssen übereinstimmen';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get register => 'Registrieren';

  @override
  String get logout => 'Abmelden';

  @override
  String get save => 'Speichern';

  @override
  String get languageSelectionTitle => 'Bitte wählen Sie Ihre Sprache';
}
