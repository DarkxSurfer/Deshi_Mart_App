import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart_app/src/view/Admin/Dashboard/dashboard_screen.dart';
import 'package:deshi_mart_app/src/view/Admin/Products/product_table.dart';
import 'package:flutter/material.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to add product to Firestore
  Future<void> _addProduct() async {
    final String name = _nameController.text;
    final double? price = double.tryParse(_priceController.text);
    final String description = _descriptionController.text;
    final String imageUrl = _imageController.text;

    if (name.isNotEmpty &&
        price != null &&
        description.isNotEmpty &&
        imageUrl.isNotEmpty) {
      await _firestore.collection('products').add({
        'name': name,
        'price': price,
        'description': description,
        'image': imageUrl,
      }).then((_) {
        Navigator.of(context).pop(); // Close the dialog
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Product added successfully!"),
        ));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to add product: $error"),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please fill all fields!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Main Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(),
                // Header Section with search and action buttons
                HeaderSection(
                  onAddProduct: _addProduct,
                  nameController: _nameController,
                  priceController: _priceController,
                  descriptionController: _descriptionController,
                  imageController: _imageController,
                ),
                // Product Table Section
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('products').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Extract product data
                      final products = snapshot.data!.docs;
                      List<List<String>> productData = products.map((product) {
                        final data = product.data()! as Map<String, dynamic>;
                        return [
                          data['image']?.toString() ??
                              '', // Ensure image is a string
                          data['name']?.toString() ??
                              '', // Ensure name is a string
                          'CASH', // Replace with actual payment method if needed
                          '\$${(data['price']?.toDouble() ?? 0).toString()}', // Ensure price is formatted correctly
                          DateTime.now()
                              .toString(), // Placeholder for order time
                          'Pending', // Placeholder for status
                        ];
                      }).toList();

                      // Prepare image paths for display
                      List<String> imagePaths = products.map((product) {
                        final data = product.data()! as Map<String, dynamic>;
                        return data['image']?.toString() ??
                            ''; // Extract image paths
                      }).toList();

                      return CustomProductTable(
                        headers: const [
                          'IMAGE',
                          'CUSTOMER NAME',
                          'METHOD',
                          'AMOUNT',
                          'ORDER TIME',
                          'STATUS',
                          'ACTIONS'
                        ],
                        data: productData,
                        imagePaths:
                            imagePaths, // Pass the image paths to the table
                        actionsBuilder: (index) => [
                          IconButton(
                              icon: const Icon(Icons.print), onPressed: () {}),
                          IconButton(
                              icon: const Icon(Icons.search), onPressed: () {}),
                        ],
                        onAllSelected: (isSelected) {
                          // Handle selection logic here
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Header Section with search and buttons
class HeaderSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController imageController;
  final Function onAddProduct;

  const HeaderSection({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
    required this.imageController,
    required this.onAddProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Search Box
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Products',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Create New Button
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Add Product"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                labelText: 'Product Name'),
                          ),
                          TextField(
                            controller: priceController,
                            decoration:
                                const InputDecoration(labelText: 'Price'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                          ),
                          TextField(
                            controller: imageController,
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pop(), // Close dialog
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          onAddProduct(); // Add product
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Create New',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
          ),
          const SizedBox(width: 16),
          // Delete Button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.white),
            label: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
