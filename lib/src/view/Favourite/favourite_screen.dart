import 'package:deshi_mart_app/src/Models/Detail/detail_screen_model.dart';
import 'package:deshi_mart_app/src/Provider/provider_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:deshi_mart_app/src/Provider/favorite_provider.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Widgets/BottomNavigationMenu/bottom_navigation_menu.dart';
import 'package:deshi_mart_app/src/Widgets/CustomWidgetGridViewCard/grid_view_card.dart';
import '../cart/cart_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BottomNavigationMenu()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      'Favourite',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
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
                                value.selectedFavourites.length.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(() => const CartScreen());
                            },
                            icon: const Icon(Icons.shopping_bag_outlined,
                                size: 33),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            SizedBox(height: height * 0.02),

            // Display the favorite items
            Expanded(
              child: Consumer<FavoriteProvider>(
                builder: (context, favouriteProvider, child) {
                  if (favouriteProvider.selectedFavourites.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(height: height * 0.33),
                        const Center(
                            child: Text('Favourite Cart is Empty 🛒',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400))),
                        // SizedBox(height: height * 0.30),
                      ],
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust based on your design
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: favouriteProvider.selectedFavourites.length,
                    itemBuilder: (context, index) {
                      var product = favouriteProvider.selectedFavourites[index];
                      return GridCard(
                        product: product,
                        onPressed: () {
                          Get.to(() => DetailScreenModel(product: product));
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
