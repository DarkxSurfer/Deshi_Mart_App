import 'package:flutter/material.dart';

import '../../../Models/Invoice/invoice_model.dart';
import '../Category/category_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeader(),
                  const SizedBox(height: 20),
                  const Text(
                    "Dashboard Overview",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  // Header Section with statistics
                  const HeaderSection(),
                  const SizedBox(height: 10),
                  const Text(
                    "Recent Orders",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: InvoiceTable(
                    headers: tableHeaders,
                    invoices: invoiceList,
                  )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Header for the Dashboard with buttons
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Colors.white,
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff019934),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Create New',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Icon(Icons.notifications),
          const SizedBox(width: 20),
          const CircleAvatar(
            backgroundColor: Color(0xff019934),
          ),
        ],
      ),
    );
  }
}

// Header Section with order statistics
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OrderStatCard(
            icon: Icons.shopping_cart_outlined,
            label: 'Total Orders',
            value: '23545',
            color: Colors.green,
          ),
          OrderStatCard(
            icon: Icons.repeat_rounded,
            label: 'Pending Orders',
            value: '23545',
            color: Colors.red,
          ),
          OrderStatCard(
            icon: Icons.fire_truck,
            label: 'Processing Orders',
            value: '23545',
            color: Colors.blue,
          ),
          OrderStatCard(
            icon: Icons.check,
            label: 'Completed Orders',
            value: '23545',
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

// Card displaying individual order statistics
class OrderStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const OrderStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.4),
            child: Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14, color: Colors.grey.withOpacity(0.8)),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
