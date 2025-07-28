import 'package:book_store/bindings/app_bindings.dart';
import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      initialRoute: AppRoutesConstants.SPLASH,
      getPages: AppPages.pages,
      title: 'BookStore',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Book Store')),
        body: Center(child: Text('Books...', style: TextStyle(fontSize: 24))),
      ),
    );
  }
}
