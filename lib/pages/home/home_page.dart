import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/widgets/book_best_sellers.dart';
import 'package:book_store/widgets/book_categories.dart';
import 'package:book_store/widgets/book_types.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/home/home_controller.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:book_store/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final _authService = Get.find<AuthService>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Searchbar(),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingPage();
        } else {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                          alignment: AlignmentGeometry.xy(0, -0.35),
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/book_store_banner.jpg',
                                width: MediaQuery.of(context).size.width * 0.85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              local.home_banner_title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ])),
                ),
              ),
              SliverToBoxAdapter(
                child: BookBestSellers(),
              ),
              SliverToBoxAdapter(
                child: BookTypes(),
              ),
              SliverToBoxAdapter(
                child: BookCategories(),
              ),
            ],
          );
        }
      }),
    );
  }
}
