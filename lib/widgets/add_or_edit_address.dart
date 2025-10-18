import 'package:book_store/core/constants/address_mode.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/addresses/addresses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddOrEditAddress extends GetView<AddressesController> {
  final int? addressId;
  final String userId;
  final String mode;
  const AddOrEditAddress(
      {this.addressId, required this.userId, required this.mode, super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(mode == AddressMode.add
                ? local.address_dialog_add_title
                : local.address_dialog_update_title),

            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Adres Adı
            TextFormField(
              controller: controller.addressName,
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return local.address_name;
                }
              },
              decoration: InputDecoration(
                  hint: Text(local.address_name,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withAlpha(80)))),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Ülke
            TextFormField(
              controller: controller.country,
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return local.country_hint;
                }
              },
              decoration: InputDecoration(
                  hint: Text(local.country,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withAlpha(80)))),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Şehir
            TextFormField(
                controller: controller.city,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.city;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.city,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // İlçe
            TextFormField(
                controller: controller.district,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.disctrict_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.disctrict,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Mahalle
            TextFormField(
                controller: controller.neighborhood,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.neighborhood_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.neighborhood,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Cadde/Sokak
            TextFormField(
                controller: controller.street,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.street_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.street,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Bina No
            TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.buildingNumber,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.building_number_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.building_number,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Daire No
            TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.apartmentNumber,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.apartment_number_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.apartment_number,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            // Posta Kodu
            TextFormField(
              inputFormatters: [MaskTextInputFormatter(mask: '#####')],
              keyboardType: TextInputType.number,
              controller: controller.postalCode,
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return local.postal_code_hint;
                }
              },
              decoration: InputDecoration(
                  hint: Text(local.postal_code,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withAlpha(80)))),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            //Buttonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge),
                  child: Text(local.address_dialog_cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge),
                  child: Text(local.address_dialog_save),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      mode == AddressMode.add
                          ? await controller.addAddress(userId)
                          : await controller.updateAddress(addressId!);
                      await controller.getAddresses(userId);
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
