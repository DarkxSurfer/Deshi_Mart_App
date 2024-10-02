import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/CustomWidgetGridViewCard/grid_view_widgets.dart';
import '../../Widgets/ProductTitle/product_title.dart';
import '../../common/Provider/provider_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Home Screen Top
                Row(
                  children: [
                    Image.asset('assets/icons/carrot.png'),
                    SizedBox(width: width * 0.15),
                    const Icon(Icons.location_on, size: 33),
                    const Text('Karachi, Pakistan',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(height: height * 0.04),

                /// Search Store
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search Store',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4)),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      suffixIcon:
                          Icon(Icons.search, size: 28, color: AColors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          ))),
                ),
                SizedBox(height: height * 0.03),

                /// Banners
                Container(
                  height: height * 0.15,
                  width: width,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/banner.png'),
                          fit: BoxFit.cover)),
                ),

                SizedBox(height: height * 0.03),

                /// Offer see All
                ProductTitle(title: 'Exclusive Offer', onPressed: () {}),
                FruitsListGridWidget(
                  products: provider.itemListOne,
                ),
                SizedBox(height: height * 0.02),
                ProductTitle(title: 'Best Selling', onPressed: () {}),
                FruitsListGridWidget(
                  products: provider.itemListTwo,
                ),
                SizedBox(height: height * 0.02),
                ProductTitle(title: 'Best Offer', onPressed: () {}),
                // SizedBox(height: height * 0.02),
                FruitsListGridWidget(
                  products: provider.itemListThree,
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// GridView.builder(
// shrinkWrap: true,
// // padding: EdgeInsets.zero,
// physics: const NeverScrollableScrollPhysics(),
// itemCount: provider.itemList.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// mainAxisExtent: height *0.3,
// crossAxisSpacing: width * 0.03,
// mainAxisSpacing: height * 0.02,
// crossAxisCount: 2),
// itemBuilder: (context, index) {
// final  item = provider.itemList[index];
// /// Provider are apply in this Widget
// return Consumer<FavouriteItem>(
// builder: (context, value, child) {
// return Container(
// padding: EdgeInsets.only(top: height * 0.03,left: width * 0.03,right: width * 0.03),
// height: height * 0.30,
// width: width * 0.45,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(12),
// border: Border.all(color: Colors.grey.withOpacity(0.5))
// ),
// child:  Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// /// under Card Image
// Image(image:  AssetImage(item.productThumbNail),height: height *0.09,fit: BoxFit.cover),
//
// SizedBox(height: height * 0.01),
// /// title
// Text(item.productName,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
// // SizedBox(height: 3),
// Text(item.productDescription,style: TextStyle(fontSize: 15,color: AColors.textLight)),
// SizedBox(height: height * 0.03),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// /// card Price
// Text(item.unitPrice,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
// Container(
// height: height * 0.06,
// width: width * 0.13,
// decoration: BoxDecoration(
// color: AColors.green,
// borderRadius: BorderRadius.circular(18),
// ),
// child: IconButton(
// onPressed: () {
// value.favouriteSelected(item.productName);
// },
// icon:   Container(
// // padding: EdgeInsets.only(bottom: 15),
// height: height * 0.06,
// width: width * 0.13,
// decoration: BoxDecoration(
// color: AColors.green,
// borderRadius: BorderRadius.circular(18),
// ),
// child:  IconButton(
// onPressed: () {
// value.favouriteSelected(item.productName);
// },
// icon: Icon(
// value.selectedFavourites.contains(item.productName)
// ? Icons.remove
//     : Icons.add,
// ),
// color: value.selectedFavourites.contains(item.productName)
// ? Colors.red : Colors.white
// )
// ),
// // color: value.selectedFavourites.contains(item.productName)
// //     ? Colors.redAccent
// //     : Colors.black,
// )
// ),
//
// ],
// ),
//
// ],
// ),
// );
// },
//
// );
// },
// )
