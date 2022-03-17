// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/app/data/coupon_codes.dart';
import 'package:invoice/app/models/coupon_code.dart';
import 'package:invoice/app/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var uniqueCartItems = <Product>[].obs;
  var couponCodes = <CouponCode>[].obs;

  addToCart(Product product) {
    cartItems.add(product);
    addUniqueItem(product);
  }

  addUniqueItem(Product product) {
    if (uniqueCartItems.contains(product)) {
      return;
    } else {
      uniqueCartItems.add(product);
    }
  }

  removeItemFromCart(Product product, int index) {
    List<Product> productItem = [];
    for (var item in cartItems) {
      if (item == product) {
        productItem.add(item);
      }
    }
    if (productItem.length <= 1) {
      Get.defaultDialog(
        title: 'Remove Item?',
        content: const Text(
            "Item can't be less than 1, do you want to remove this item from cart?"),
        textConfirm: 'Remove from Cart',
        textCancel: 'Cancel',
        confirmTextColor: Colors.white,
        onConfirm: () {
          cartItems.remove(product);
          uniqueCartItems.removeAt(index);
          Get.back();
        },
      );
    } else {
      for (var item in cartItems) {
        if (item == product) {
          cartItems.removeAt(cartItems.indexOf(item));
          break;
        }
      }
    }
  }

  int get getTotalItemOnCart => cartItems.length;

  double get getTotalPrice => cartItems.fold(
        0,
        (previousValue, product) =>
            previousValue + int.parse(product.price!).toDouble(),
      );
  double getSingleProductTotalPrice(Product product) {
    List<Product> singleProducts = [];
    double sum = 0.0;
    for (var item in cartItems) {
      if (item == product) {
        singleProducts.add(item);
      }
    }
    for (var item in singleProducts) {
      sum = sum + int.parse(item.price!).toDouble();
    }
    return sum;
  }

  int getSingleProductCount(Product product) {
    List<Product> singleProducts = [];

    for (var item in cartItems) {
      if (item == product) {
        singleProducts.add(item);
      }
    }
    return singleProducts.length;
  }

  getCouponCodes() async {
    Future.delayed(const Duration(seconds: 1));
    var coupons = CouponData.couponList;
    couponCodes.addAll(coupons);
  }

  verifyCoupon(String code) {
    var response = {"expired": false, "isInValid": false};
    for (var item in couponCodes) {
      if (item.code != code) {
        response['isInValid'] = true;
      }
    }
  }

  @override
  void onInit() {
    getCouponCodes();
    super.onInit();
  }
}
