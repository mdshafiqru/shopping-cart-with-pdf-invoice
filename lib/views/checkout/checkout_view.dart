import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Page'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
    );
  }
}
