import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
            onPressed: () {
              Get.updateLocale(Get.locale!.languageCode == 'en' ? Locale('tr') : Locale('en'));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                fixedSize: Size(55, 55),
                padding: EdgeInsets.zero),
            child: Image.network(
                width: 20,
                Get.locale!.languageCode == 'en'
                    ? 'https://www.clipartmax.com/png/full/41-413003_english-uk-flag-circle-vector.png'
                    : 'https://cdn.countryflags.com/thumbs/turkey/flag-round-250.png')),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  fixedSize: Size(55, 55),
                  padding: EdgeInsets.zero),
              child: Icon(
                Get.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                size: 20,
              ))
        ],
      ),
      body: Center(
        child: Obx(
          () => Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      decoration: InputDecoration(labelText: local.login_email),
                      controller: controller.emailController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: MultiValidator([
                        RequiredValidator(errorText: local.emailRequired),
                        EmailValidator(errorText: local.emailInvalid)
                      ]).call),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: local.login_password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.visiblePassword.value = !controller.visiblePassword.value;
                        },
                        icon: Icon(
                          controller.visiblePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: !controller.visiblePassword.value,
                    controller: controller.passwordController,
                    onFieldSubmitted: (value) {
                      controller.submitForm();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: MultiValidator([
                      RequiredValidator(errorText: local.passwordRequired),
                      MinLengthValidator(8, errorText: local.passwordMinLength),
                      PatternValidator(r'[A-Z]', errorText: local.passwordUpperCase),
                      PatternValidator(r'[a-z]', errorText: local.passwordUpperCase),
                      PatternValidator(r'[!@#\$&*~%^()_\-+=<>?/.,]',
                          errorText: local.passwordSymbol)
                    ]).call,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submitForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text(local.signIn),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      Get.toNamed(AppRoutesConstants.REGISTER);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text(local.signUp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
