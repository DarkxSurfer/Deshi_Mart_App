import 'package:deshi_mart_app/src/Provider/provider_state.dart';
import 'package:deshi_mart_app/src/services/Stripe%20Service/stripe_key.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  StripeServices._();

  static final StripeServices instance = StripeServices._();

  /// Make Payment Function
  Future<void> makePayment() async {
    FavouriteItem favouriteItem = FavouriteItem();

    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
          20, 'usd'); // Amount in dollars, currency in lowercase
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentClientSecret,
              merchantDisplayName: 'Anis Ur rehman'));
      await _processPayment();
    } catch (e) {
      print('Error during payment creation: $e');
    }
  }

  /// crete Payment intent
  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();

      // Prepare data as a map for FormUrlEncoded
      final data = {
        'amount': _calculatorAmount(amount), // Amount should be in cents
        'currency': currency,
        'payment_method_types[]': 'card', // Add payment method type
      };

      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents', // Stripe endpoint
        data: data, // Send data as a Map
        options: Options(
          contentType:
              Headers.formUrlEncodedContentType, // Correct content type
          headers: {
            'Authorization':
                'Bearer $secretKey', // Ensure this is your Stripe Secret Key
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
      print(e);
    }
  }

  /// CalculatorAmount
  String _calculatorAmount(int amount) {
    final calculatedAmount = amount * 100; // Convert dollars to cents
    return calculatedAmount.toString();
  }
}
