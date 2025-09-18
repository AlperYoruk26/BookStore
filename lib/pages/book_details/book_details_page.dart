import 'package:book_store/components/custom_button.dart';
import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/book_details/book_details_controller.dart';
import 'package:book_store/pages/cart/cart_controller.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BookDetailsPage extends GetView<BookDetailsController> {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final cartController = Get.find<CartController>();

    final bookId = args['book_id'];
    final language = args['lang'];

    debugPrint('bookid: $bookId, language: $language');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadBook(bookId, language);
      controller.postIsInWishlist(bookId);
      controller.postIsInCart(bookId);
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Obx(() => ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingPage();
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => controller.isInWishlist.value
                        ? controller.deleteRemoveFromWishlist(bookId)
                        : controller.postAddToWishlist(bookId),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          controller.isInWishlist.value
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 34,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(local.wishlist_title,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 1.05,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color(0x7006070D),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 7))
                    ], borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.network(
                        controller.book.value?.cover ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        controller.book.value?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 30),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => pushScreen(
                            context,
                            screen: SearchPage(),
                            withNavBar: true,
                            settings: RouteSettings(
                                name: AppRoutesConstants.SEARCH,
                                arguments: {
                                  'author': controller.book.value?.author,
                                  'lang': Get.locale?.languageCode,
                                  'page': AppRoutesConstants.BOOK_DETAILS
                                }),
                          ),
                          child: Text(
                            controller.book.value?.author ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${local.book_details_price}: ${controller.book.value?.price ?? ''}\$',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          controller.book.value?.description ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        color: Theme.of(context).colorScheme.primary,
                        onColor: Theme.of(context).colorScheme.onPrimary,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(local.book_details_buy_button),
                        onTap: () {
                          debugPrint('Buy Now');
                        }),
                    CustomButton(
                        color: controller.isTempTitle.value
                            ? Colors.green
                            : Theme.of(context).colorScheme.secondary,
                        onColor: Theme.of(context).colorScheme.onPrimary,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          controller.isTempTitle.value
                              ? local.book_details_in_cart_button
                              : local.book_details_cart_button,
                        ),
                        onTap: () async {
                          if (!controller.isTempTitle.value) {
                            debugPrint('Add to Cart');
                            controller.changeText();
                            controller.isInCart.value
                                ? cartController.increments(bookId)
                                : {
                                    await controller.postAddToCart(bookId),
                                    controller.isInCart.value = true
                                  };
                          } else {
                            null;
                          }
                        }),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
