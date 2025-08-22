import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/book_details/book_details_controller.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsPage extends GetView<BookDetailsController> {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final bookId = args['book_id'];
    final language = args['lang'];

    debugPrint('bookid: $bookId, language: $language');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadBook(bookId, language);
      controller.postIsInWishlst(bookId);
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
                        Text('Wishlist',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ),
                ),
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Text(
                        controller.book.value?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 30),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.book.value?.author ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005),
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
                    ElevatedButton(
                      onPressed: () => debugPrint('Buy Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: Text(local.book_details_buy_button),
                    ),
                    ElevatedButton(
                      onPressed: () => debugPrint('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary),
                      child: Text(local.book_details_cart_button),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
