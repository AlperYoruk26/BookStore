// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get login_email => 'E-posta';

  @override
  String get login_password => 'Şifre';

  @override
  String get register_first_name => 'Ad';

  @override
  String get register_last_name => 'Soyad';

  @override
  String get register_email => 'E-posta';

  @override
  String get register_password => 'Şifre';

  @override
  String get register_confirm_password => 'Şifreyi Onayla';

  @override
  String get emailRequired => 'E-posta zorunlu';

  @override
  String get emailInvalid => 'Geçerli bir e-posta adresi giriniz';

  @override
  String get passwordRequired => 'Şifre zorunlu';

  @override
  String get passwordMinLength => 'En az 8 karakter';

  @override
  String get passwordUpperCase => 'En az 1 büyük harf';

  @override
  String get passwordLowerCase => 'En az 1 küçük harf';

  @override
  String get passwordSymbol => 'En az 1 sembol';

  @override
  String get firstNameRequired => 'Adınızı giriniz';

  @override
  String get lastNameRequired => 'Soyadınızı giriniz';

  @override
  String get passwordsDoNotMatch => 'Şifreler aynı olmalıdır';

  @override
  String get signIn => 'Giriş Yap';

  @override
  String get signUp => 'Kayıt Ol';

  @override
  String get register => 'Kayıt Ol';

  @override
  String get logout => 'Çıkış';

  @override
  String get save => 'Kaydet';

  @override
  String get languageSelectionTitle => 'Lütfen dilinizi seçin';
}
