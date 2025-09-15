import 'package:book_store/components/custom_alert_dialog.dart';
import 'package:book_store/components/custom_button.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/cart/cart_controller.dart';
import 'package:book_store/pages/checkout/checkout_page.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: LoadingPage());
          } else {
            return Column(
              // Ana Column
              children: [
                // Başlık ve Divider kısmı (sabit yükseklikte)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // EdgeInsetsGeometry.all yerine const kullan
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.cart_title,
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
                                    color: Theme.of(context)
                                        .navigationBarTheme
                                        .shadowColor!,
                                    width: 1))),
                      ),
                    ],
                  ),
                ),

                // Kitap listesi artık Expanded içinde, kalan alanı dolduracak
                Expanded(
                  // <-- BURADA DEĞİŞİKLİK YAPIYORUZ
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.books.map((book) {
                        final RxMap<int, int> counts = controller.itemCount;

                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context)
                                            .navigationBarTheme
                                            .shadowColor!,
                                        width: 1))),
                            child: Row(
                              children: [
                                // Kitap Görseli
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(boxShadow: const [
                                      // const ekle
                                      BoxShadow(
                                          color: Color(0x7006070D),
                                          spreadRadius: 0,
                                          blurRadius: 7,
                                          offset: Offset(0, 7))
                                    ], borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)), // const ekle
                                      child: Image.network(
                                        book.cover,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.03,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  // Kitap Bilgileri
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Text(
                                            book.author,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${book.price.toStringAsFixed(2)} \$',
                                      ),
                                    ],
                                  ),
                                ),
                                // Spacer(),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () => showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CustomAlertDialog(
                                                        title: local
                                                            .wishlist_dialog_title,
                                                        content: local
                                                            .wishlist_dialog_content,
                                                        cancelText: local
                                                            .wishlist_dialog_cancel,
                                                        onCancel: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        confirmText: local
                                                            .wishlist_dialog_confirm,
                                                        onConfirm: () {
                                                          controller
                                                              .deleteRemoveFromCart(
                                                                  book.id);
                                                          controller.getCart();
                                                          counts[book.bookId] = 1;
                                                          Navigator.of(context)
                                                              .pop();
                                                        }),
                                              ),
                                          child: Icon(
                                            Icons.delete,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                      Container(
                                        padding:
                                            const EdgeInsets.all(2), // const ekle
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  controller.decrements(book.bookId),
                                              child: Icon(
                                                Icons.remove,
                                                size: 24,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                            ),
                                            Container(
                                                width: 40,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    // const ekle
                                                    border: Border.symmetric(
                                                        vertical: BorderSide(
                                                  width: 1,
                                                ))),
                                                child: Text(
                                                  counts[book.bookId].toString(),
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                )),
                                            GestureDetector(
                                              onTap: () =>
                                                  controller.increments(book.bookId),
                                              child: Icon(
                                                Icons.add,
                                                size: 24,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Spacer() widget'ını kaldırıyoruz

                // Alt kısım (fiyat toplamı ve buton)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0), // const ekle
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Theme.of(context)
                                      .navigationBarTheme
                                      .shadowColor!,
                                  width: 2),
                              bottom: BorderSide(
                                  color: Theme.of(context)
                                      .navigationBarTheme
                                      .shadowColor!,
                                  width: 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${local.cart_total}:',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            '${controller.books.fold<double>(
                                  0.0,
                                  (sum, book) =>
                                      sum +
                                      (book.price *
                                          (controller.itemCount[book.bookId]!)),
                                ).toStringAsFixed(2)} \$',
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomButton(
                      width: MediaQuery.of(context).size.width * 0.9,
                      title: local.cart_button,
                      onTap: () => pushScreen(context,
                          screen: const CheckoutPage(),
                          withNavBar: true), // const ekle
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                )
              ],
            );
          }
        }));
  }
}
