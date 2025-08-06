import 'package:book_store/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookBestSellers extends GetView<HomeController> {
  const BookBestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Best Sellers',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 250,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: (controller.books
                            .toList() //TODO: yanlış liste üstünden işlem yapışıyor yenisi oluşturulacak
                          ..sort((a, b) => b.sales.compareTo(a.sales)))
                        .take(4)
                        .map((book) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ), //TODO: daha iyi bir yöntem bul
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: BoxBorder.all(width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(8))),
                                width: MediaQuery.of(context).size.width * 0.44,
                                height: MediaQuery.of(context).size.width * 0.66,
                              ),
                              SizedBox(height: 10),
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
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
