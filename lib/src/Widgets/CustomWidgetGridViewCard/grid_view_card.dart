import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/Constant/colors.dart';
import '../../common/Provider/provider_state.dart';
import '../../view/Home/Item Models/fruits_model_list.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.product, this.onTap});
  final ItemModel product;
  final onTap;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FavouriteItem>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
            height: height * 0.30,
            width: width * 0.45,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// under Card Image
                Image(
                    image: AssetImage(product.productThumbNail),
                    height: height * 0.09,
                    fit: BoxFit.cover),

                SizedBox(height: height * 0.01),

                /// title
                Text(product.productName,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(product.productDescription,
                    style: TextStyle(fontSize: 15, color: AColors.textLight)),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// card Price
                    Text(product.unitPrice,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    IconButton(
                      onPressed: () {
                        value.favouriteSelected(product);
                      },
                      icon: Icon(
                        value.selectedFavourites.contains(product)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                      color: value.selectedFavourites.contains(product)
                          ? AColors.green
                          : Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
