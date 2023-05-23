import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  Future openCheckout() async {
    var options = {
      'key': 'xxxxxxx',
      'amount': 28200,
      'name': 'food',
      'description': 'Payment',
      'prefill': {'contact': '9005243445', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName}", timeInSecForIosWeb: 4);
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Razorpay integation in flutter',
            style: TextStyle(fontSize: 20.0, color: Color(0xFF545D68))),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: FilledButton(
              style: FilledButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () async {
                await openCheckout();
              },
              child: const Text('Checkout',
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
      ),
      body: Center(
        child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/b/b3/Razorpay_logo.webp'),
      ),
    );
  }
}
