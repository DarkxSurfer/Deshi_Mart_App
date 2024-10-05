import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Utils/Constant/colors.dart';

List<StepperData> stepperData = [
  /// First data
  StepperData(
      title: StepperText('Order placed',textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
      subtitle: StepperText('Your order has been placed',textStyle: TextStyle(fontSize: 14,color: AColors.textLight)),
      iconWidget: Container(
        decoration:  const BoxDecoration(
          color: Colors.green,
          // shape: BoxShape.circle
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: const Icon(Icons.check_circle_rounded,color: Colors.white,size: 20,),
      )
  ),

  /// 2nd data
  StepperData(
      title: StepperText('Preparing',textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
      subtitle: StepperText('Your order has been prepared'),
      iconWidget: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: const Icon(Icons.check_circle_rounded,color: Colors.white,size: 20,),
      )
  ),

  /// third  data
  StepperData(
      title: StepperText('On the way',textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
      subtitle: StepperText('our delivery executive is on the way in deliver your item'),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration:  const BoxDecoration(
          color: Colors.lightGreen,
          // border: Border.all(color: AColors.primaryLight),
          shape: BoxShape.circle,
        ),
        child:  const CircleAvatar(radius: 5,backgroundColor: Colors.white),
      )
  ),
  /// final  data
  StepperData(
      title: StepperText('delivered',textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
      iconWidget: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child:  Stack(
          children: [
            const Center(child: Icon(Icons.history,color: Colors.green,size: 25,),),
            Center(child: SpinKitPulse(color: Colors.green.withOpacity(0.7),size: 50,)),
          ],
        ),
      )
  ),
];
