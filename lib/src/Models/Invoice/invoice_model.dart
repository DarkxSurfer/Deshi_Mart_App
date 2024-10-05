import 'package:flutter/material.dart';

// Model class for Invoice
class Invoice {
  final String invoiceNo;
  final String customerName;
  final String method;
  final String amount;
  final String orderTime;
  final String status;

  Invoice({
    required this.invoiceNo,
    required this.customerName,
    required this.method,
    required this.amount,
    required this.orderTime,
    required this.status,
  });
}

class InvoiceTable extends StatelessWidget {
  final List<String> headers;
  final List<Invoice> invoices;
  final Color headerColor;
  final double borderRadius;

  const InvoiceTable({
    super.key,
    required this.headers,
    required this.invoices,
    this.headerColor = const Color(0xff019934), // Default header color
    this.borderRadius = 10.0, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom header row with configurable color and border radius
        Container(
          decoration: BoxDecoration(
              color: headerColor.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              )),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            children:
                headers.map((header) => _buildHeaderCell(header)).toList(),
          ),
        ),
        // Data Table
        Expanded(
          child: ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (context, index) {
              final invoice = invoices[index];
              return Container(
                color: Colors.grey[200], // Light grey background for rows
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    _buildDataCell(invoice.invoiceNo),
                    _buildDataCell(invoice.customerName),
                    _buildDataCell(invoice.method),
                    _buildDataCell(invoice.amount),
                    _buildDataCell(invoice.orderTime),
                    _buildDataCell(invoice.status),
                    _buildActionsCell(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Function to create header cells with consistent style
  Widget _buildHeaderCell(String text) {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Function to create data cells with consistent style
  Widget _buildDataCell(String text) {
    return Expanded(
      child: Text(text),
    );
  }

  // Function to create action buttons for each row
  Widget _buildActionsCell() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              // Implement print functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
    );
  }
}
