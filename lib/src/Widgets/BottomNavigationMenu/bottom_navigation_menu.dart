import 'package:deshi_mart_app/src/Provider/favorite_provider.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/view/AccountScreen/account_screen.dart';
import 'package:deshi_mart_app/src/view/cart/cart_screen.dart';
import 'package:deshi_mart_app/src/view/products/find_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../Provider/provider_state.dart';
import '../../view/Favourite/favourite_screen.dart';
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
    const FavouriteScreen(),
    const AccountScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context, listen: true);

    return Scaffold(
      body: listChildren[_currentIndex],
      bottomNavigationBar: Consumer<FavouriteItem>(
        builder: (context, value, child) => SizedBox(
          height: 85,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AColors.green,
            unselectedItemColor: Colors.grey,
            iconSize: 30,
            selectedLabelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black,
            ),
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              // Home
              const BottomNavigationBarItem(
                icon: Icon(Iconsax.shop),
                activeIcon: Icon(Iconsax.shop_add5),
                label: 'Shop',
              ),
              // Explore
              const BottomNavigationBarItem(
                icon: Icon(Icons.manage_search_outlined),
                activeIcon: Icon(Icons.manage_search),
                label: 'Explore',
              ),
              // Cart
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.shopping_bag, size: 30),
                icon: value.selectedFavourites.isEmpty
                    ? const Icon(Icons.shopping_bag_outlined, size: 30)
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.shopping_bag_outlined, size: 30),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AColors.green,
                              child: Text(
                                value.selectedFavourites.length.toString(),
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
                label: 'Cart',
              ),
              // Favourite
              BottomNavigationBarItem(
                icon: provider.selectedFavourites.isEmpty
                    ? const Icon(Icons.favorite_border_outlined, size: 30)
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.favorite_border_outlined, size: 30),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AColors.green,
                              child: Text(
                                provider.selectedFavourites.length.toString(),
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
                activeIcon: const Icon(Icons.favorite),
                label: 'Favourite',
              ),
              // Account
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
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

