import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/view/cart/cart_screen.dart';
import 'package:deshi_mart_app/src/view/products/find_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../common/Provider/provider_state.dart';
import '../../view/Home/home_screen.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<BottomNavigationMenu> {
  int _currentIndex = 0;

  final listChildren = [
    const HomeScreen(),
    const FindProductsScreen(),
    const CartScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.green),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listChildren[_currentIndex],
        bottomNavigationBar: Consumer<FavouriteItem>(
          builder: (context, value, child) => SizedBox(
            height: 85,
            child: BottomNavigationBar(

                /// esko jab ap remove kro ge to icons oper nichy hona shore ho jai gy
                type: BottomNavigationBarType.fixed, // Add this line
                selectedItemColor: AColors.green,
                unselectedItemColor: Colors.grey,
                iconSize: 30,
                selectedLabelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black),
                onTap: onTabTapped, // new
                currentIndex: _currentIndex, // new
                items: [
                  /// Home
                  const BottomNavigationBarItem(
                      icon: Icon(Iconsax.shop),
                      activeIcon: Icon(Iconsax.shop_add5),
                      label: 'Shop'),

                  /// Notification
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.manage_search_outlined),
                      activeIcon: Icon(Icons.manage_search),
                      label: 'Explore'),

                  /// Add to cart
                  BottomNavigationBarItem(
                    activeIcon: const Icon(Icons.shopping_bag, size: 30),
                    icon: value.selectedFavourites.isEmpty
                        ? const Icon(Icons.shopping_bag_outlined, size: 30)
                        : Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Icon(Icons.shopping_bag_outlined,
                                  size: 30), // Fixed Icon size
                              Positioned(
                                top: -4, // Adjust this to control the position
                                right: -4, // Adjust as per your requirement
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: AColors.green,
                                  child: Text(
                                    value.selectedFavourites.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    label: 'Cart',
                  ),

                  /// Profile
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline),
                      activeIcon: Icon(Icons.favorite),
                      label: 'Favourite'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                      label: 'Account'),
                ]),
          ),
        ));
  }
}



/// Bottom Navigation Icons

// Image.asset('assets/Icons/btn_home.png',height: 30,width: 30)

// Image.asset('assets/Icons/btn_shopping_cart.png',height: 30,width: 30),

// Image.asset('assets/Icons/btn_user_icon.png',height: 30,width: 30)


// Consumer<FavouriteItem>(builder: (context, value, child)
// => Stack(
// children: [
//
// IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag_outlined,size: 27,color: Colors.white)),
// Positioned(
// top: 15,
// right: 5,
// child: CircleAvatar(radius: 8,backgroundColor: TColors.primary,
// child: Text(value.selectedFavourites.length.toString(),
// style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white)))
// ),
//
// ],
// ),)

