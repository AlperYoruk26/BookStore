import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/book_details/book_details_page.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/pages/wishlist/wishlist_controller.dart';
import 'package:book_store/components/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class WishlistPage extends GetView<WishlistController> {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: LoadingPage(),
            );
          } else {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    local.wishlist_title,
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
                  Column(
                      children: controller.books
                          .map((book) => GestureDetector(
                                onTap: () => pushScreen(context,
                                    screen: BookDetailsPage(),
                                    withNavBar: true,
                                    settings: RouteSettings(
                                        name: AppRoutesConstants.BOOK_DETAILS,
                                        arguments: {
                                          "book_id": book.bookId,
                                          "lang": book.language
                                        })),
                                child: Dismissible(
                                  key: ValueKey<int>(book.id),
                                  direction: DismissDirection.startToEnd,
                                  background: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.error,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white70,
                                          size: 32,
                                        ),
                                        Text(
                                          local.wishlist_dialog_confirm,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  confirmDismiss: (direction) => showDialog(
                                    context: context,
                                    builder: (context) => CustomAlertDialog(
                                        title: local.wishlist_dialog_title,
                                        content: local.wishlist_dialog_content,
                                        cancelText: local.wishlist_dialog_cancel,
                                        onCancel: () {
                                          Navigator.of(context).pop();
                                        },
                                        confirmText: local.wishlist_dialog_confirm,
                                        onConfirm: () {
                                          controller
                                              .deleteRemoveFromWishlist(book.id);
                                          controller.getWishlist();
                                          Navigator.of(context).pop();
                                        }),
                                  ),
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
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 8.0),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.2,
                                            height:
                                                MediaQuery.of(context).size.width *
                                                    0.3,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0x7006070D),
                                                      spreadRadius: 0,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 7))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              child: Image.network(book.cover,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.03,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.width *
                                              0.3,
                                          // Kitap Bilgileri
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    book.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    book.author,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${book.price} \$',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () => debugPrint('Add to Cart'),
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: Text(
                                              local.wishlist_cart_button,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.03,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList()),
                ],
              ),
            ));
          }
        }));
  }
}
