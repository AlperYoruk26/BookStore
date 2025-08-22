import 'package:book_store/core/constants/screen_contants.dart';
import 'package:book_store/pages/wishlist/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarConfig navBarConfig;
  const CustomNavBar({super.key, required this.navBarConfig});
  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.find<WishlistController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).navigationBarTheme.shadowColor!,
                  width: 1))),
      child: Row(
        children: [
          for (int index = 0; index < navBarConfig.items.length; index++)
            Expanded(
              child: InkWell(
                onTap: () {
                  navBarConfig.onItemSelected(index); // Tab değişimini tetikle
                  // Wishlist tab'ı için refresh
                  if (index == 1) {
                    // örnek: 1. index wishlist
                    // wishlistController.isLoading.value = true;
                    wishlistController.getWishlist();
                    // wishlistController.isLoading.value = false;
                  }
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.icons[index],
                        color: navBarConfig.selectedIndex == index
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor!
                            : Colors.grey,
                        size: navBarConfig.selectedIndex == index ? 28 : 24,
                      ),
                      // if (navBarConfig.items[index].title != null)
                      //   Text(
                      //     navBarConfig.items[index].title!,
                      //     style: TextStyle(
                      //       color: navBarConfig.selectedIndex == index ? Colors.blue : Colors.grey,
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
