import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart_app/src/Widgets/CustomWidgetGridViewCard/grid_view_card.dart';
import 'package:deshi_mart_app/src/view/Admin/SideBarNavigation/sidebar_navigation.dart';
import 'package:deshi_mart_app/src/view/Home/Item%20Models/fruits_model_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.to(const Sidebar());
              },
              child: const Text("Go"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // Check if there are no products
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No products available"));
            }

            // Display the products
            final products = snapshot.data!.docs;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust based on your design
                childAspectRatio: 0.8,
                crossAxisSpacing: 8.0, // Add spacing between grid items
                mainAxisSpacing: 8.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var productDoc = products[index];
                // Convert Firestore document to ItemModel
                var product = ItemModel.fromFirestore(productDoc);

                return GridCard(
                  product: product,
                  onPressed: () {
                    // Handle product tap, e.g., navigate to product details
                    print("Tapped on ${product.productName}");
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
