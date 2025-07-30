// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get login_email => 'E-mail';

  @override
  String get login_password => 'Mot de passe';

  @override
  String get register_first_name => 'Prénom';

  @override
  String get register_last_name => 'Nom';

  @override
  String get register_email => 'E-mail';

  @override
  String get register_password => 'Mot de passe';

  @override
  String get register_confirm_password => 'Confirmer le mot de passe';

  @override
  String get emailRequired => 'L\'e-mail est requis';

  @override
  String get emailInvalid => 'Veuillez entrer une adresse e-mail valide';

  @override
  String get passwordRequired => 'Le mot de passe est requis';

  @override
  String get passwordMinLength => 'Au moins 8 caractères';

  @override
  String get passwordUpperCase => 'Au moins 1 majuscule';

  @override
  String get passwordLowerCase => 'Au moins 1 minuscule';

  @override
  String get passwordSymbol => 'Au moins 1 symbole';

  @override
  String get firstNameRequired => 'Veuillez entrer votre prénom';

  @override
  String get lastNameRequired => 'Veuillez entrer votre nom';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe doivent correspondre';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get register => 'S\'inscrire';

  @override
  String get logout => 'Déconnexion';

  @override
  String get save => 'Enregistrer';

  @override
  String get languageSelectionTitle => 'Veuillez sélectionner votre langue';
}
