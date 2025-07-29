import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
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
                    decoration: InputDecoration(labelText: local.register_first_name),
                    controller: controller.firstNameController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return local.firstNameRequired;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(labelText: local.register_last_name),
                    controller: controller.lastNameController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return local.lastNameRequired;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      decoration: InputDecoration(labelText: local.register_email),
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
                        labelText: local.register_password,
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.visiblePassword.value = !controller.visiblePassword.value;
                            },
                            icon: Icon(controller.visiblePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    obscureText: !controller.visiblePassword.value,
                    controller: controller.passwordController,
                    textInputAction: TextInputAction.next,
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
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: local.register_confirm_password,
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibleConfirmPassword.value =
                                  !controller.visibleConfirmPassword.value;
                            },
                            icon: Icon(controller.visibleConfirmPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    obscureText: !controller.visibleConfirmPassword.value,
                    controller: controller.confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      controller.submitForm();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != controller.passwordController.text) {
                        return local.passwordsDoNotMatch;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          (controller.passwordController.text ==
                              controller.confirmPasswordController.text)) {
                        controller.submitForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text(local.register),
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
