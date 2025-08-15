import 'package:book_store/pages/category_details/category_details_controller.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsPage extends GetView<CategoryDetailsController> {
  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final typeId = args['type_id'];
    final categoryId = args['category_id'];
    final categoryName = args['category_name'];
    final language = args['language'];

    // controller.isLoading.value = true;
    controller.getBooks(typeId, categoryId, language);
    // controller.isLoading.value = false;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            controller.books.value = [];
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(() {
        if (controller.books.isEmpty) {
          return LoadingPage();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 2,
                  children: controller.books.map((book) {
                    return Card(
                      color: Colors.transparent,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.44,
                                  height: MediaQuery.of(context).size.width * 0.66,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Color(0x7006070D),
                                        spreadRadius: 0,
                                        blurRadius: 7,
                                        offset: Offset(0, 7))
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    child: Image.network(
                                      book.cover,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              // Text kısmı aynı
                              Container(
                                width: MediaQuery.of(context).size.width * 0.44,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              book.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              book.author,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ]),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${book.price}\$',
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
