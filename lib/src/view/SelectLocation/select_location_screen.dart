import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/view/PhoneNo/PhoneLogin/phone_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  _SelectLocationScreenState createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  // Lists for dropdown options
  List<String> zones = ['Johar', 'Gulshan', 'Clifton'];
  List<String> areas = ['Area 1', 'Area 2', 'Area 3'];

  // Variables to store selected values
  String? selectedZone;
  String? selectedArea;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(mapImage)),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Select Your Location',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                'Switch on your location to stay in tune with what\'s happening in your area',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown for Zones
            const Text('Your Zone', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedZone,
              hint: const Text('Select your zone'),
              items: zones.map((String zone) {
                return DropdownMenuItem<String>(
                  value: zone,
                  child: Text(zone),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedZone = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            // Dropdown for Areas
            const Text('Your Area', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedArea,
              hint: const Text('Select your area'),
              items: areas.map((String area) {
                return DropdownMenuItem<String>(
                  value: area,
                  child: Text(area),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedArea = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: height * 0.06,
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const PhoneLoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // Submit Button
          ],
        ),
      ),
    );
  }
}




// Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (selectedZone != null && selectedArea != null) {
//                     // Perform action, e.g., submit data or navigate to another screen
//                     print('Zone: $selectedZone, Area: $selectedArea');
//                   } else {
//                     // Show error message
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text('Please select both zone and area')),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   textStyle: const TextStyle(fontSize: 18),
//                 ),
//                 child: const Text('Submit'),
//               ),
//             ),