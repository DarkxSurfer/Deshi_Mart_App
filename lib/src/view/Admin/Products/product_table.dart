import 'package:flutter/material.dart';

class CustomProductTable extends StatefulWidget {
  final List<String> headers;
  final List<List<String>> data;
  final List<Widget> Function(int) actionsBuilder;
  final List<String> imagePaths;
  final bool allSelected;
  final Function(bool) onAllSelected;

  const CustomProductTable({
    super.key,
    required this.headers,
    required this.data,
    required this.actionsBuilder,
    required this.imagePaths,
    this.allSelected = false,
    required this.onAllSelected,
  });

  @override
  State<CustomProductTable> createState() => _CustomProductTableState();
}

class _CustomProductTableState extends State<CustomProductTable> {
  bool allSelected = false;

  @override
  void initState() {
    super.initState();
    allSelected = widget.allSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          // Custom header row with light green background
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff019934).withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Row(
              children: [
                _buildCheckBoxCell(isHeader: true),
                for (String header in widget.headers) _buildHeaderCell(header),
              ],
            ),
          ),
          // Data Table
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.length, // Number of rows
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[200], // Light grey background for rows
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      _buildCheckBoxCell(),
                      for (int i = 0; i < widget.data[index].length; i++)
                        i == 0
                            ? _buildImage(widget.imagePaths[index])
                            : _buildDataCell(widget.data[index][i]),
                      Row(
                        children: widget.actionsBuilder(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to create header cells with consistent style
  Widget _buildHeaderCell(String text) {
    return Flexible(
      fit: FlexFit.tight,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center, // Center align text
      ),
    );
  }

  // Function to create data cells with consistent style
  Widget _buildDataCell(String text) {
    return Flexible(
      fit: FlexFit.tight,
      child: Text(
        text,
        textAlign: TextAlign.center, // Center align text
      ),
    );
  }

  // Function to create aligned image cell
  Widget _buildImage(String path) {
    return SizedBox(
      width: 70, // Fixed width for image column
      height: 70, // Fixed height for the image to keep consistency
      child: Image.network(
        path,
        fit: BoxFit.contain, // Ensure the image fits within the container
        errorBuilder: (context, error, stackTrace) {
          return const Center(
              child: Text('Image not found')); // Placeholder for missing images
        },
      ),
    );
  }

  // Function to create checkbox cell
  Widget _buildCheckBoxCell({bool isHeader = false}) {
    return SizedBox(
      width: 50, // Fixed width for checkbox column
      child: Center(
        child: isHeader
            ? Checkbox(
                value: allSelected,
                onChanged: (value) {
                  setState(() {
                    allSelected = value!;
                  });
                  widget.onAllSelected(allSelected);
                },
              )
            : const Checkbox(
                value: false,
                onChanged: null, // Add logic for individual rows if needed
              ),
      ),
    );
  }
}
