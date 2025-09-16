import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/book_details/book_details_page.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/pages/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class SearchPage extends GetView<SearchbarController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final searchText = args['search_text'];
    final author = args['author'];
    final language = args['lang'];
    final previousPage = args['page'];

    debugPrint('bookid: $searchText, language: $language');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      previousPage == AppRoutesConstants.HOME
          ? controller.searchBooksByName(searchText, language)
          : controller.searchBooksByAuthor(author, language);
    });
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (controller.isLoading.value) {
            return LoadingPage();
          } else {
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Arama Sonucu',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 2,
                  children: controller.searchBooks.map((book) {
                    return GestureDetector(
                      onTap: () => pushScreen(
                        context,
                        screen: BookDetailsPage(),
                        withNavBar: true,
                        settings: RouteSettings(
                            arguments: {'book_id': book.id, 'lang': language}),
                      ),
                      child: Card(
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: Image.network(
                                        book.cover,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Text kısmı aynı
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.44,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]);
          }
        }));
  }
}
