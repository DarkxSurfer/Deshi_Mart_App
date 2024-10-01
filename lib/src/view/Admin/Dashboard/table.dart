import 'package:flutter/material.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom header row with light green background
        Container(
          decoration: BoxDecoration(
              color: const Color(0xff019934).withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            children: [
              _buildHeaderCell('INVOICE NO'),
              _buildHeaderCell('CUSTOMER NAME'),
              _buildHeaderCell('METHOD'),
              _buildHeaderCell('AMOUNT'),
              _buildHeaderCell('ORDER TIME'),
              _buildHeaderCell('STATUS'),
              _buildHeaderCell('ACTIONS'),
            ],
          ),
        ),
        // Data Table
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Number of rows
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey[200], // Light grey background for rows
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    _buildDataCell('#DSFSD322'),
                    _buildDataCell('NITISH KUMAR'),
                    _buildDataCell('CASH'),
                    _buildDataCell('\$32423'),
                    _buildDataCell('May 28, 2024 9:31 AM'),
                    _buildDataCell('Pending'),
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
