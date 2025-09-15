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

  @override
  String get save => 'Save';

  @override
  String get change => 'Change';

  @override
  String get languageSelectionTitle => 'Please select your language';

  @override
  String get login_success_title => 'Login Successful';

  @override
  String login_success_message(Object email) {
    return 'Welcome, $email';
  }

  @override
  String get login_error_title => 'Login Error';

  @override
  String get login_error_message => 'Email or password is incorrect';

  @override
  String get book_category_see_all => 'See All';

  @override
  String get no_category_title => 'No categories available';

  @override
  String get home_banner_title => 'Welcome to the Book Store';

  @override
  String get profile_title => 'My Account';

  @override
  String get profile_name => 'Name';

  @override
  String get profile_email => 'Email';

  @override
  String get actionSheet_title => 'Seçim yap';

  @override
  String get actionSheet_camera => 'Kamera';

  @override
  String get actionSheet_gallery => 'Galeri';

  @override
  String get actionSheet_cancel => 'İptal';

  @override
  String get app_settings => 'App Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get book_details_price => 'Price';

  @override
  String get book_details_buy_button => 'Buy Now';

  @override
  String get book_details_cart_button => 'Add to Cart';

  @override
  String get wishlist_title => 'Wishlist';

  @override
  String get wishlist_dialog_title => 'Remove from Wishlist';

  @override
  String get wishlist_dialog_content => 'Are you sure?';

  @override
  String get wishlist_dialog_cancel => 'Cancel';

  @override
  String get wishlist_dialog_confirm => 'Delete';

  @override
  String get wishlist_cart_button => 'Add to Cart';

  @override
  String get cart_title => 'Cart';

  @override
  String get cart_total => 'Cart Total';

  @override
  String get cart_button => 'Complete Shopping';

  @override
  String get checkout_title => 'Order Details';
}
