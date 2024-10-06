import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Widgets/productCard/productGridList.dart';
import 'package:flutter/material.dart';

class FindProductsScreen extends StatelessWidget {
  const FindProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.06),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // <--- Add this to shrink-wrap the Column

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Find Products',
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(height: height * 0.034),

              /// Search Store
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search Store',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon:
                        const Icon(Icons.search, size: 28, color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                        ))),
              ),

              SizedBox(height: height * 0.9, child: Productgridlist())
            ],
          ),
        ),
      ),
    );
  }
}
