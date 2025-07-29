import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/pages/home/home_binding.dart';
import 'package:book_store/pages/home/home_page.dart';
import 'package:book_store/pages/login/login_binding.dart';
import 'package:book_store/pages/login/login_page.dart';
import 'package:book_store/pages/register/register_binding.dart';
import 'package:book_store/pages/register/register_page.dart';
import 'package:book_store/pages/splash/splash_binding.dart';
import 'package:book_store/pages/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppRoutesConstants.SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: AppRoutesConstants.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
      name: AppRoutesConstants.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(name: AppRoutesConstants.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
