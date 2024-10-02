import 'package:flutter/material.dart';
import 'package:deshi_mart_app/src/common/Provider/provider_state.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../Utils/Constant/colors.dart';
import '../../Widgets/BottomNavigationMenu/bottom_navigation_menu.dart';
import '../cart/cart_screen.dart';
import 'favouriteListViewBuilderWidgets/favourite_list_view_builder_widgets.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavouriteItem>(context ,listen: false);
    // final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.06),
        child: Column(
          children: [
            Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            // Get.to(() => const BottomNavigationMenu());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const BottomNavigationMenu()));
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Text('Favourite',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      Consumer<FavouriteItem>(
                          builder: (context, value, child) => Stack(
                            children: [
                              Positioned(
                                  top: 15,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: AColors.green,
                                    child: Text(
                                        value.selectedFavourites.length
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Get.to(() => const CartScreen());
                                  },
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      size: 33)),
                            ],
                          )),
                    ],
                  ),
                )),
            Divider(color: Colors.grey.withOpacity(0.3)),
            SizedBox(height: height * 0.02),

            /// Selected cart itemList
            const FavouriteListViewBuilderWidgets()
          ],
        ),
      ),
    );
  }
}


