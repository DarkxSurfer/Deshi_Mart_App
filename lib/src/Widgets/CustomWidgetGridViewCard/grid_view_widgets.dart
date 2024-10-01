import 'package:flutter/material.dart';

import '../../view/Home/Item Models/fruits_model_list.dart';
import 'grid_view_card.dart';

class FruitsListGridWidget extends StatelessWidget {
  const FruitsListGridWidget({
    super.key, required this.products,

  });

  final List<ItemModel> products;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: height * 0.01),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: height *0.3,
          crossAxisSpacing: width * 0.03,
          mainAxisSpacing: height * 0.02,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        // final  item = provider.itemList[index];
        /// Provider are apply in this Widget
        return  GridCard(product: products[index]);
      },
    );
  }
}
