import 'package:deshi_mart_app/src/Provider/provider_state.dart';
import 'package:deshi_mart_app/src/services/Stripe%20Service/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Utils/Constant/colors.dart';
import '../../Widgets/BottomNavigationMenu/bottom_navigation_menu.dart';
import 'cartListViewBuilderWidgets/list_view_cart_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavouriteItem>(context ,listen: false);
    // final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                                  builder: (_) =>
                                      const BottomNavigationMenu()));
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text('My Cart',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    Consumer<FavouriteItem>(
                      builder: (context, value, child) => value
                              .selectedFavourites.isEmpty
                          ? IconButton(
                              onPressed: () {
                                Get.to(() => const CartScreen());
                              },
                              icon: const Icon(Icons.shopping_bag_outlined,
                                  size: 30))
                          : Stack(
                              clipBehavior: Clip.none,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => const CartScreen());
                                  },
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      size: 30),
                                ),
                                Positioned(
                                  top: 1,
                                  right: 1,
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: AColors.green,
                                    child: Text(
                                      value.selectedFavourites.length
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              )),
              Divider(color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: height * 0.02),

              /// Selected cart itemList
              SizedBox(
                  height: height * 0.8,
                  child: const CartListViewBuilderWidgets())
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<FavouriteItem>(
        builder: (context, value, child) {
          return value.selectedFavourites.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(
                      left: width * 0.12,
                      bottom: height * 0.02,
                      right: width * 0.12),
                  height: height * 0.06,
                  width: width * 0.05,
                  child: SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          StripeServices.instance.makePayment(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AColors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text('Go to Checkout   ${value.getTotalPrice()}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ))
              : const SizedBox(); // Empty widget if no items in cart
        },
      ),
    );
  }
}
