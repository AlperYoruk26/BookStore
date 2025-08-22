import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @login_email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get login_email;

  /// No description provided for @login_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_password;

  /// No description provided for @register_first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get register_first_name;

  /// No description provided for @register_last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get register_last_name;

  /// No description provided for @register_email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get register_email;

  /// No description provided for @register_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get register_password;

  /// No description provided for @register_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get register_confirm_password;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUpperCase.
  ///
  /// In en, this message translates to:
  /// **'At least 1 uppercase letter'**
  String get passwordUpperCase;

  /// No description provided for @passwordLowerCase.
  ///
  /// In en, this message translates to:
  /// **'At least 1 lowercase letter'**
  String get passwordLowerCase;

  /// No description provided for @passwordSymbol.
  ///
  /// In en, this message translates to:
  /// **'At least 1 special character'**
  String get passwordSymbol;

  /// No description provided for @firstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name'**
  String get firstNameRequired;

  /// No description provided for @lastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name'**
  String get lastNameRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords must match'**
  String get passwordsDoNotMatch;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @languageSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Please select your language'**
  String get languageSelectionTitle;

  /// No description provided for @login_success_title.
  ///
  /// In en, this message translates to:
  /// **'Login Successful'**
  String get login_success_title;

  /// No description provided for @login_success_message.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {email}'**
  String login_success_message(Object email);

  /// No description provided for @login_error_title.
  ///
  /// In en, this message translates to:
  /// **'Login Error'**
  String get login_error_title;

  /// No description provided for @login_error_message.
  ///
  /// In en, this message translates to:
  /// **'Email or password is incorrect'**
  String get login_error_message;

  /// No description provided for @book_category_see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get book_category_see_all;

  /// No description provided for @no_category_title.
  ///
  /// In en, this message translates to:
  /// **'No categories available'**
  String get no_category_title;

  /// No description provided for @home_banner_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the Book Store'**
  String get home_banner_title;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get profile_title;

  /// No description provided for @profile_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profile_name;

  /// No description provided for @profile_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profile_email;

  /// No description provided for @actionSheet_title.
  ///
  /// In en, this message translates to:
  /// **'Seçim yap'**
  String get actionSheet_title;

  /// No description provided for @actionSheet_camera.
  ///
  /// In en, this message translates to:
  /// **'Kamera'**
  String get actionSheet_camera;

  /// No description provided for @actionSheet_gallery.
  ///
  /// In en, this message translates to:
  /// **'Galeri'**
  String get actionSheet_gallery;

  /// No description provided for @actionSheet_cancel.
  ///
  /// In en, this message translates to:
  /// **'İptal'**
  String get actionSheet_cancel;

  /// No description provided for @app_settings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get app_settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @book_details_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get book_details_price;

  /// No description provided for @book_details_buy_button.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get book_details_buy_button;

  /// No description provided for @book_details_cart_button.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get book_details_cart_button;

  /// No description provided for @wishlist_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Remove from Wishlist'**
  String get wishlist_dialog_title;

  /// No description provided for @wishlist_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get wishlist_dialog_content;

  /// No description provided for @wishlist_dialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get wishlist_dialog_cancel;

  /// No description provided for @wishlist_dialog_confirm.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get wishlist_dialog_confirm;

  /// No description provided for @wishlist_cart_button.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get wishlist_cart_button;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
