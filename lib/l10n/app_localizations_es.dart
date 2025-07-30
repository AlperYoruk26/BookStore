// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get login_email => 'Correo electrónico';

  @override
  String get login_password => 'Contraseña';

  @override
  String get register_first_name => 'Nombre';

  @override
  String get register_last_name => 'Apellido';

  @override
  String get register_email => 'Correo electrónico';

  @override
  String get register_password => 'Contraseña';

  @override
  String get register_confirm_password => 'Confirmar contraseña';

  @override
  String get emailRequired => 'El correo electrónico es obligatorio';

  @override
  String get emailInvalid => 'Introduce una dirección de correo electrónico válida';

  @override
  String get passwordRequired => 'La contraseña es obligatoria';

  @override
  String get passwordMinLength => 'Al menos 8 caracteres';

  @override
  String get passwordUpperCase => 'Al menos 1 letra mayúscula';

  @override
  String get passwordLowerCase => 'Al menos 1 letra minúscula';

  @override
  String get passwordSymbol => 'Al menos 1 símbolo';

  @override
  String get firstNameRequired => 'Introduce tu nombre';

  @override
  String get lastNameRequired => 'Introduce tu apellido';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas deben coincidir';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get register => 'Registrarse';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get save => 'Guardar';

  @override
  String get languageSelectionTitle => 'Por favor seleccione su idioma';
}
