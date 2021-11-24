// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/app/controllers/cart/cart_controller.dart';
import 'package:invoice/app/data/constants/color_palette.dart';
import 'package:invoice/app/data/constants/strings.dart';
import 'package:invoice/app/models/product.dart';
import 'package:invoice/app/views/checkout/checkout_view.dart';
import 'package:invoice/app/views/home/home_view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key, required this.cartController}) : super(key: key);
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('My Cart'),
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: whiteColor,
                  size: 25,
                ),
                Obx(
                  () => Text(
                    '${cartController.getTotalItemOnCart}',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: cartController.uniqueCartItems.isNotEmpty
                      ? ListView.builder(
                          itemCount: cartController.uniqueCartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            Product product =
                                cartController.uniqueCartItems[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 3,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: whiteColor, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 2,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: 100,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            // image: NetworkImage(AppString
                                            //     .defaultProductImage),
                                            image: AssetImage(
                                                AppString.DEFAULT_ASSET_IMG),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${product.title}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 3),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Size',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                          Obx(
                                            () => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '\$${product.price} ',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                        Text(
                                                          'X ${cartController.getSingleProductCount(product)}',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '\$${cartController.getSingleProductTotalPrice(product)}',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Card(
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          cartController
                                                              .removeItemFromCart(
                                                                  product,
                                                                  index);
                                                        },
                                                        icon:
                                                            Icon(Icons.remove),
                                                      ),
                                                      Text(
                                                          '${cartController.getSingleProductCount(product)}'),
                                                      IconButton(
                                                        onPressed: () {
                                                          cartController
                                                              .addToCart(
                                                                  product);
                                                        },
                                                        icon: Icon(Icons.add),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'No product in cart',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              MaterialButton(
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Get.to(() => HomeView(),
                                      transition: Transition.leftToRight);
                                },
                                child: Text(
                                  'Continue Shopping',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: whiteColor,
                                  ),
                                ),
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                ),
                cartController.uniqueCartItems.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: whiteColor, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 200,
                            width: size.width,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          width: size.width / 1.3,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: Colors.lightBlue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.center,
                                                  children: [
                                                    TextFormField(
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15,
                                                                vertical: 2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'Enter coupon code',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  ),
                                                ),
                                                height: 50,
                                                elevation: 0,
                                                color: primaryColor,
                                                onPressed: () {},
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Get.to(
                                      () => CheckoutView(),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  child: Text(
                                    'Checkout Now',
                                    style: TextStyle(
                                        fontSize: 18, color: whiteColor),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: primaryColor,
                                  elevation: 5,
                                  height: 50,
                                  minWidth: 200,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
