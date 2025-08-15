import 'package:book_store/bindings/app_bindings.dart';
import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/core/constants/theme_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/routes/app_pages.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:book_store/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await dotenv.load(fileName: ".env");
  await AppBindings().dependencies();

  // StorageService'i bul ve dil kodunu al
  final _storageService = Get.find<StorageService>();
  final savedLang = await _storageService.getValue<String>(StorageConstants.appLanguage) ?? 'en';
  final savedTheme =
      await _storageService.getValue<String>(StorageConstants.appTheme) ?? ThemeConstants.light;
  final primaryColor =
      await _storageService.getValue<int>(StorageConstants.primaryColor) ?? Color(0xFFD45555).value;
  runApp(MyApp(initialLang: savedLang, initialTheme: savedTheme, initialColor: primaryColor));
}

class MyApp extends StatelessWidget {
  final String initialLang;
  final String initialTheme;
  final int initialColor;
  const MyApp({required this.initialLang, required this.initialTheme, required this.initialColor})
      : super();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutesConstants.INITIAL,
      getPages: AppPages.pages,
      title: 'BookStore',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(Color(initialColor)),
      darkTheme: AppTheme.darkTheme(Color(initialColor)),
      themeMode: initialTheme == ThemeConstants.light ? ThemeMode.dark : ThemeMode.light,
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(initialLang),
    );
  }
}
