// ignore_for_file: deprecated_member_use

import 'package:book_store/components/custom_button.dart';
import 'package:book_store/core/utils/get_card_type_utils.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/cart/cart_controller.dart';
import 'package:book_store/pages/checkout/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final cartController = Get.find<CartController>();
    final formKey = GlobalKey<FormState>();
    final adressController = ExpansionTileController();
    final paymentController = ExpansionTileController();
    final cardNameFocus = FocusNode();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Obx(
        () => Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  local.checkout_title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 30),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color:
                                  Theme.of(context).navigationBarTheme.shadowColor!,
                              width: 1))),
                ),
                ExpansionTile(
                  collapsedIconColor: Theme.of(context).colorScheme.primary,
                  initiallyExpanded: true,
                  controller: adressController,
                  title: Text(
                    'Adres Bilgileri',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  children: [
                    // Container(
                    //   height: MediaQuery.of(context).size.width * 0.01,
                    //   decoration: BoxDecoration(
                    //       border: Border(
                    //           bottom: BorderSide(
                    //               color: Theme.of(context)
                    //                   .navigationBarTheme
                    //                   .shadowColor!,
                    //               width: 1))),
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    TextFormField(
                        controller: controller.name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hint: Text(
                          'Tam ad',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withAlpha(80)),
                        ))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                      controller: controller.phone,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: '### ### ## ##')
                      ],
                      decoration: InputDecoration(
                          hint: Text('Telefon',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withAlpha(80)))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                      controller: controller.country,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hint: Text('Ülke',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withAlpha(80)))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                        controller: controller.city,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hint: Text('Şehir',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withAlpha(80))))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                        controller: controller.town,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hint: Text('İlçe',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withAlpha(80))))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                      inputFormatters: [MaskTextInputFormatter(mask: '#####')],
                      keyboardType: TextInputType.number,
                      controller: controller.postalCode,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hint: Text('Posta kodu',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withAlpha(80)))),
                      onFieldSubmitted: (value) {
                        if (adressController.isExpanded) {
                          adressController.collapse();
                        }
                        if (!paymentController.isExpanded) {
                          paymentController.expand();
                        }

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (cardNameFocus.canRequestFocus) {
                            cardNameFocus.requestFocus();
                          }
                        });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Theme.of(context).colorScheme.primary,
                  controller: paymentController,
                  title: Text(
                    'Ödeme Bilgileri',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  children: [
                    TextFormField(
                      focusNode: cardNameFocus,
                      controller: controller.cardHolderName,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kartın üzerindeki adı giriniz';
                        }
                      },
                      decoration: InputDecoration(
                          hint: Text('Kart üzerindeki ad',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withAlpha(80)))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: '#### #### #### ####')
                      ],
                      keyboardType: TextInputType.number,
                      controller: controller.cardNumber,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 19) {
                          return 'Kart numaranızı giriniz';
                        }
                      },
                      decoration: InputDecoration(
                          hint: Text('Kart numarası',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withAlpha(80))),
                          suffixIcon: Obx(() => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: getCardType(controller.cardNumberText.value)))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: TextFormField(
                              inputFormatters: [
                                MaskTextInputFormatter(mask: '##/##')
                              ],
                              controller: controller.cardExpiredDate,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Son kullanma tarihini giriniz';
                                }
                              },
                              decoration: InputDecoration(
                                  hint: Text('Son kullanma tarihi',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withAlpha(80)))),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                if (paymentController.isExpanded) {
                                  paymentController.collapse();
                                }
                              },
                              inputFormatters: [MaskTextInputFormatter(mask: '###')],
                              controller: controller.cardCvc,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'CVV numarasını giriniz';
                                }
                              },
                              decoration: InputDecoration(
                                  hint: Text('CVV',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withAlpha(80)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text('Sipariş Özeti',
                    style: Theme.of(context).textTheme.headlineMedium),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color:
                                  Theme.of(context).navigationBarTheme.shadowColor!,
                              width: 1))),
                ),
                Column(
                  children: cartController.books.map((book) {
                    return ListTile(
                      leading: Text(
                          '${cartController.itemCount[book.bookId].toString()}x',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 16)),
                      title: Text(
                        book.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 18),
                      ),
                      subtitle: Text(book.author,
                          style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Text(
                          '${(cartController.itemCount[book.bookId]! * book.price).toStringAsFixed(2)}\$',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 20)),
                    );
                  }).toList(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color:
                                  Theme.of(context).navigationBarTheme.shadowColor!,
                              width: 2),
                          bottom: BorderSide(
                              color:
                                  Theme.of(context).navigationBarTheme.shadowColor!,
                              width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${local.cart_total}:',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '${cartController.books.fold<double>(
                              0.0,
                              (sum, book) =>
                                  sum +
                                  (book.price *
                                      (cartController.itemCount[book.bookId]!)),
                            ).toStringAsFixed(2)} \$',
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CustomButton(
                    width: MediaQuery.of(context).size.width,
                    title: 'Ödemeyi Onayla',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint('═══════════════════════════════════════');
                        debugPrint('           FORM VERİLERİ               ');
                        debugPrint('═══════════════════════════════════════');

                        debugPrint('--- Adres Bilgileri ---');
                        debugPrint('Ad Soyad: ${controller.name.text}');
                        debugPrint('Telefon: ${controller.phone.text}');
                        debugPrint('Ülke: ${controller.country.text}');
                        debugPrint('Şehir: ${controller.city.text}');
                        debugPrint('İlçe: ${controller.town.text}');
                        debugPrint('Posta Kodu: ${controller.postalCode.text}');

                        debugPrint('\n--- Ödeme Bilgileri ---');
                        debugPrint(
                            'Kart Üzerindeki İsim: ${controller.cardHolderName.text}');
                        debugPrint('Kart Numarası: ${controller.cardNumber.text}');
                        debugPrint(
                            'Son Kullanma Tarihi: ${controller.cardExpiredDate.text}');
                        debugPrint('CVV: ${controller.cardCvc.text}');

                        debugPrint('═══════════════════════════════════════');
                      }
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
