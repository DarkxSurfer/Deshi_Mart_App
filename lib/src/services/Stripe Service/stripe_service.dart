import 'package:deshi_mart_app/src/Provider/favorite_provider.dart';
import 'package:deshi_mart_app/src/Provider/provider_state.dart';
import 'package:deshi_mart_app/src/services/Stripe%20Service/stripe_key.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

class StripeServices {
  StripeServices._();

  static final StripeServices instance = StripeServices._();

  /// Make Payment Function
  Future<void> makePayment(BuildContext context) async {
    try {
      // Use Provider to get the total price
      final provider = Provider.of<FavouriteItem>(context, listen: false);
      String totalPriceStr =
          provider.getTotalPrice(); // Assuming getTotalPrice returns String

      // Convert the price from String to int
      int totalPrice =
          int.tryParse(totalPriceStr) ?? 0; // Safely parsing String to int

      // Create a payment intent with the total price in cents
      String? paymentIntentClientSecret =
          await _createPaymentIntent(totalPrice, 'usd');
      if (paymentIntentClientSecret == null) return;

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'Anis Ur Rehman',
        ),
      );

      // Present the payment sheet to the user
      await _processPayment();
    } catch (e) {
      print('Error during payment creation: $e');
    }
  }

  /// Create Payment Intent
  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();

      final data = {
        'amount': _calculateAmount(amount), // Amount in cents
        'currency': currency,
        'payment_method_types[]': 'card', // Payment method type
      };

      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $secretKey', // Use your Stripe Secret Key
          },
        ),
      );

      if (response.data != null) {
        return response
            .data['client_secret']; // Returning the payment intent ID
      }
      return null;
    } catch (e) {
      print('Error: ${e.toString()}');
      if (e is DioException) {
        print('Response Status Code: ${e.response?.statusCode}');
        print('Response Data: ${e.response?.data}');
      }
      return null;
    }
  }

  /// Process Payment
  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print('Payment processing error: $e');
    }
  }

  /// Calculate Amount (Convert dollars to cents)
  int _calculateAmount(int amount) {
    return amount * 100; // Convert dollars to cents
  }
}
