import 'package:book_store/core/constants/screen_contants.dart';
import 'package:book_store/pages/book_details/book_details_controller.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/pages/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsPage extends GetView<BookDetailsController> {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final bookId = args['book_id'];
    final language = args['lang'];

    debugPrint('bookid: $bookId, language: $language');

    controller.loadBook(bookId, language);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            controller.book.value = null;
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => GestureDetector(
                  onTap: () => controller.isTouched.value = !controller.isTouched.value,
                  child: Icon(
                    controller.isTouched.value ? Icons.bookmark : Icons.bookmark_outline,
                    size: 34,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
          )
        ],
      ),
      body: Obx(() {
        if (controller.book.value == null) {
          return LoadingPage();
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                        controller.book.value!.cover,
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
                        controller.book.value!.name,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.book.value!.author,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Price: ${controller.book.value!.price}\$',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          controller.book.value!.description,
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
                      child: Text('Buy Now'),
                    ),
                    ElevatedButton(
                      onPressed: () => debugPrint('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary),
                      child: Text('Add to Cart'),
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
