import 'package:deshi_mart_app/src/Provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/Constant/colors.dart';
import '../../view/Home/Item Models/fruits_model_list.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.product, required this.onPressed});
  final ItemModel product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Listen to FavouriteItem changes
    return Consumer<FavoriteProvider>(
      builder: (context, favouriteProvider, child) {
        bool isFavourite =
            favouriteProvider.selectedFavourites.contains(product);

        return GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
            height: height * 0.30,
            width: width * 0.45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card Image
                Image(
                  image: AssetImage(product.productThumbNail),
                  height: height * 0.09,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: height * 0.01),

                // Title
                Text(
                  product.productName,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),

                // Description
                Text(
                  product.productDescription,
                  style: TextStyle(
                    fontSize: 15,
                    color: AColors.textLight,
                  ),
                ),
                SizedBox(height: height * 0.03),

                // Price and Heart Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Card Price
                    Text(
                      product.unitPrice,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                    // Heart Icon
                    IconButton(
                      onPressed: () {
                        favouriteProvider.favouriteSelected(product);
                      },
                      icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_outline,
                      ),
                      color: isFavourite ? AColors.green : Colors.black,
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
