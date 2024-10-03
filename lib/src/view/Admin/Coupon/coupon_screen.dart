import 'package:deshi_mart_app/src/Models/Invoice/invoice_model.dart';
import 'package:deshi_mart_app/src/view/Admin/Dashboard/dashboard_screen.dart';

import 'package:flutter/material.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

List<String> tableHeaders = [
  'INVOICE NO',
  'CUSTOMER NAME',
  'METHOD',
  'AMOUNT',
  'ORDER TIME',
  'STATUS',
  'ACTIONS'
];

List<Invoice> invoiceList = [
  Invoice(
    invoiceNo: '#DSFSD322',
    customerName: 'NITISH KUMAR',
    method: 'CASH',
    amount: '\$32423',
    orderTime: 'May 28, 2024 9:31 AM',
    status: 'Pending',
  ),
  // Add more invoices here
];

class _CouponScreenState extends State<CouponScreen> {
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
                const HeaderSection(),
                // Product Table Section
                Expanded(
                  child: InvoiceTable(
                    headers: tableHeaders,
                    invoices: invoiceList,
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

// Sidebar Component (same as before)

// Header Section with search and buttons
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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
            onPressed: () {},
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
