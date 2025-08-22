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
  String get change => 'Değiştir';

  @override
  String get languageSelectionTitle => 'Lütfen dilinizi seçin';

  @override
  String get login_success_title => 'Giriş Başarılı';

  @override
  String login_success_message(Object email) {
    return 'Hoş geldiniz, $email';
  }

  @override
  String get login_error_title => 'Giriş Hatası';

  @override
  String get login_error_message => 'Email veya şifre hatalı';

  @override
  String get book_category_see_all => 'Tümünü Gör';

  @override
  String get no_category_title => 'Kategori yok';

  @override
  String get home_banner_title => 'Kitapçıya Hoş Geldiniz';

  @override
  String get profile_title => 'Hesabım';

  @override
  String get profile_name => 'İsim';

  @override
  String get profile_email => 'Eposta';

  @override
  String get actionSheet_title => 'Make a selection';

  @override
  String get actionSheet_camera => 'Camera';

  @override
  String get actionSheet_gallery => 'Gallery';

  @override
  String get actionSheet_cancel => 'Cancel';

  @override
  String get app_settings => 'Uygulama Ayarları';

  @override
  String get language => 'Dil';

  @override
  String get theme => 'Tema';

  @override
  String get book_details_price => 'Fiyat';

  @override
  String get book_details_buy_button => 'Satın Al';

  @override
  String get book_details_cart_button => 'Sepete Ekle';

  @override
  String get wishlist_dialog_title => 'İstek Listesinden Kaldır';

  @override
  String get wishlist_dialog_content => 'Emin misiniz?';

  @override
  String get wishlist_dialog_cancel => 'İptal';

  @override
  String get wishlist_dialog_confirm => 'Sil';

  @override
  String get wishlist_cart_button => 'Sepete Ekle';
}
