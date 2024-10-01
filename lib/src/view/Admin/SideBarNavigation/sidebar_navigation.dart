import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/view/Admin/Dashboard/dashboard_screen.dart';
import 'package:deshi_mart_app/src/view/Admin/Products/products_screen.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  // List of pages corresponding to each sidebar item
  final List<Widget> _pages = [
    const DashboardScreen(),
    const AdminProductScreen(),
    const Center(child: Text('Category Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

  // Function to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          // Sidebar container
          Container(
            height: height,
            width: 200,
            color: Colors.green[50],
            child: SingleChildScrollView(
              // Add scrolling if content overflows
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Image.asset(logocolor),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "DESHI",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00CA44),
                                    fontWeight: FontWeight.bold),
                              ),
                              horizontalSpaceTiny,
                              Text(
                                "MART",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffF6921E),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            "Desh ka market",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SidebarItem(
                    icon: Icons.dashboard,
                    label: 'Dashboard',
                    index: 0,
                    isSelected: _selectedIndex == 0, // Check if selected
                    onTap: () => _onItemTapped(0), // Switch to Dashboard
                  ),
                  const SizedBox(height: 20),
                  SidebarItem(
                    icon: Icons.shopping_bag,
                    label: 'Products',
                    index: 1,
                    isSelected: _selectedIndex == 1, // Check if selected
                    onTap: () => _onItemTapped(1), // Switch to Products
                  ),
                  const SizedBox(height: 20),
                  SidebarItem(
                    icon: Icons.category,
                    label: 'Category',
                    index: 2,
                    isSelected: _selectedIndex == 2, // Check if selected
                    onTap: () => _onItemTapped(2), // Switch to Category
                  ),
                  const SizedBox(height: 20),
                  SidebarItem(
                    icon: Icons.settings,
                    label: 'Settings',
                    index: 3,
                    isSelected: _selectedIndex == 3, // Check if selected
                    onTap: () => _onItemTapped(3), // Switch to Settings
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: _pages[_selectedIndex], // Display the selected page
          )
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[700] : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
