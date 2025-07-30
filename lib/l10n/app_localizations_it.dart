// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get login_email => 'E-mail';

  @override
  String get login_password => 'Password';

  @override
  String get register_first_name => 'Nome';

  @override
  String get register_last_name => 'Cognome';

  @override
  String get register_email => 'E-mail';

  @override
  String get register_password => 'Password';

  @override
  String get register_confirm_password => 'Conferma password';

  @override
  String get emailRequired => 'L\'e-mail è obbligatoria';

  @override
  String get emailInvalid => 'Inserisci un indirizzo e-mail valido';

  @override
  String get passwordRequired => 'La password è obbligatoria';

  @override
  String get passwordMinLength => 'Almeno 8 caratteri';

  @override
  String get passwordUpperCase => 'Almeno 1 lettera maiuscola';

  @override
  String get passwordLowerCase => 'Almeno 1 lettera minuscola';

  @override
  String get passwordSymbol => 'Almeno 1 simbolo';

  @override
  String get firstNameRequired => 'Inserisci il tuo nome';

  @override
  String get lastNameRequired => 'Inserisci il tuo cognome';

  @override
  String get passwordsDoNotMatch => 'Le password devono coincidere';

  @override
  String get signIn => 'Accedi';

  @override
  String get signUp => 'Registrati';

  @override
  String get register => 'Registrati';

  @override
  String get logout => 'Disconnettersi';

  @override
  String get save => 'Salva';

  @override
  String get languageSelectionTitle => 'Seleziona la tua lingua';
}
