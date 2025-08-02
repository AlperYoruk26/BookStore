import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCategories extends GetView<HomeController> {
  const BookCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Obx(() {
      int totalMatches = controller.categories.fold(0, (sum, category) {
        final count = controller.books.where((book) => book.categoryId == category.id).length;
        return sum + count;
      });

      if (totalMatches == 0) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              local.no_category_title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        );
      }

      return Column(
        children: controller.categories.map((category) {
          int matchCount = controller.books.where((book) => book.categoryId == category.id).length;

          return matchCount != 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ListTile(
                      leading:
                          Text(category.name, style: Theme.of(context).textTheme.headlineLarge),
                      trailing: GestureDetector(
                        onTap: () {
                          debugPrint('tıkladım');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              local.book_category_see_all,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Theme.of(context).textTheme.bodyMedium!.color,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.66 + 80, // Card yüksekliği
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: controller.books
                                .where((b) => b.categoryId == category.id)
                                .take(4)
                                .map((book) {
                          // Mevcut card kodunuz aynı kalacak
                          return Card(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Resim kısmı aynı
                                    if (book.cover.split('.')[1] != 'jpg')
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.44,
                                        height: MediaQuery.of(context).size.width * 0.66,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          child: Image.network(
                                            book.cover,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (book.cover.split('.')[1] == 'jpg')
                                      Container(
                                        decoration: BoxDecoration(
                                            border: BoxBorder.all(width: 1),
                                            borderRadius: BorderRadius.all(Radius.circular(8))),
                                        width: MediaQuery.of(context).size.width * 0.44,
                                        height: MediaQuery.of(context).size.width * 0.66,
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
                        }).toList()),
                      ),
                    )
                  ]))
              : SizedBox.shrink();
        }).toList(),
      );
    });
  }
}
