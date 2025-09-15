import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/pages/book_details/book_details_page.dart';
import 'package:book_store/pages/cart/cart_binding.dart';
import 'package:book_store/pages/cart/cart_page.dart';
import 'package:book_store/pages/category_details/category_details_page.dart';
import 'package:book_store/pages/checkout/checkout_page.dart';
import 'package:book_store/pages/home/home_binding.dart';
import 'package:book_store/pages/home/home_page.dart';
import 'package:book_store/pages/language_selector/language_selector_binding.dart';
import 'package:book_store/pages/language_selector/language_selector_page.dart';
import 'package:book_store/pages/loading/loading_binding.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/pages/login/login_binding.dart';
import 'package:book_store/pages/login/login_page.dart';
import 'package:book_store/pages/main/main_binding.dart';
import 'package:book_store/pages/main/main_page.dart';
import 'package:book_store/pages/profile/profile_binding.dart';
import 'package:book_store/pages/profile/profile_page.dart';
import 'package:book_store/pages/register/register_binding.dart';
import 'package:book_store/pages/register/register_page.dart';
import 'package:book_store/pages/settings/settings_binding.dart';
import 'package:book_store/pages/settings/settings_page.dart';
import 'package:book_store/pages/splash/splash_binding.dart';
import 'package:book_store/pages/splash/splash_page.dart';
import 'package:book_store/pages/wishlist/wishlist_binding.dart';
import 'package:book_store/pages/wishlist/wishlist_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: AppRoutesConstants.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutesConstants.LANGUAGE_SELECTOR,
        page: () => LanguageSelectorPage(),
        binding: LanguageSelectorBinding()),
    GetPage(
        name: AppRoutesConstants.LOADING,
        page: () => LoadingPage(),
        binding: LoadingBinding()),
    GetPage(
        name: AppRoutesConstants.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: AppRoutesConstants.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
        name: AppRoutesConstants.MAIN,
        page: () => MainPage(),
        binding: MainBinding()),
    GetPage(
        name: AppRoutesConstants.HOME,
        page: () => HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutesConstants.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: AppRoutesConstants.SETTINGS,
        page: () => SettingsPage(),
        binding: SettingsBinding()),
    GetPage(
        name: AppRoutesConstants.CATEGORY_DETAILS,
        page: () => CategoryDetailsPage()),
    GetPage(
      name: AppRoutesConstants.BOOK_DETAILS,
      page: () => BookDetailsPage(),
    ),
    GetPage(
        name: AppRoutesConstants.WISHLIST,
        page: () => WishlistPage(),
        binding: WishlistBinding()),
    GetPage(
        name: AppRoutesConstants.CART,
        page: () => CartPage(),
        binding: CartBinding()),
    GetPage(name: AppRoutesConstants.CHECKOUT, page: () => CheckoutPage())
  ];
}
