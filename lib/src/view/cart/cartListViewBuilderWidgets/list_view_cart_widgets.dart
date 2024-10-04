import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Constant/colors.dart';
import '../../../Widgets/CartScreenWidgets/Counting_Icon.dart';
import '../../../Provider/provider_state.dart';

class CartListViewBuilderWidgets extends StatelessWidget {
  const CartListViewBuilderWidgets({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context, listen: false);
    // final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FavouriteItem>(
      builder: (context, value, child) {
        if (value.selectedFavourites.isEmpty) {
          return Column(
            children: [
              const Center(
                  child: Text('Cart is Empty',
                      style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w400))),
              Lottie.asset(
                  'assets/Animation/Animation - 1727797649563 (1).json',
                  height: height * 0.63,
                  repeat: true),
              // SizedBox(height: height * 0.30),
            ],
          );
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: provider.selectedFavourites.length,
              itemBuilder: (context, index) {
                final item = value.selectedFavourites[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(image: AssetImage(item.productThumbNail)),
                              SizedBox(width: width * 0.05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// Product title
                                      Text(item.productName,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),

                                      /// Product description

                                      Text(item.productDescription,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AColors.textLight)),
                                      SizedBox(height: height * 0.02),

                                      Row(
                                        children: [
                                          /// Remove Button
                                          CountingIcons(
                                            icon: Icons.remove,
                                            color: AColors.textLight,
                                            onPressed: () {
                                              int currentQuantity =
                                                  value.itemQuantities[
                                                          item.productId] ??
                                                      1;
                                              if (currentQuantity > 1) {
                                                value.updateQuantity(
                                                    item,
                                                    currentQuantity -
                                                        1); // Decrease quantity
                                              }
                                            },
                                          ),
                                          SizedBox(width: width * 0.03),

                                          /// Quantity Display
                                          Text(
                                            '${value.itemQuantities[item.productId] ?? 1}', // Display current quantity
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(width: width * 0.03),

                                          /// Add Button
                                          CountingIcons(
                                            icon: Icons.add,
                                            color: AColors.green,
                                            onPressed: () {
                                              int currentQuantity =
                                                  value.itemQuantities[
                                                          item.productId] ??
                                                      1;
                                              value.updateQuantity(
                                                  item,
                                                  currentQuantity +
                                                      1); // Increase quantity
                                            },
                                          ),
                                          SizedBox(width: width * 0.20),

                                          /// Product Price
                                          Text(
                                            // Calculate the total price based on quantity
                                            '\$${(double.parse(item.unitPrice.substring(1)) * (value.itemQuantities[item.productId] ?? 1)).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    value.removeFromFavourites(item);
                                  },
                                  child: const Icon(Icons.delete)))
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      Divider(color: Colors.grey.withOpacity(0.3)),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
