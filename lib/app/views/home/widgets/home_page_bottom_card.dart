// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/app/controllers/cart/cart_controller.dart';
import 'package:invoice/app/views/cart/cart_view.dart';

class HomePageBottomCard extends StatelessWidget {
  const HomePageBottomCard({
    Key? key,
    required this.size,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 110,
      decoration: const BoxDecoration(
        color: Colors.teal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => Text(
                'Total: \$${cartController.getTotalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Get.to(
                    () => CartView(cartController: cartController),
                    transition: Transition.rightToLeft,
                  );
                },
                child: const Text(
                  'View Cart',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
