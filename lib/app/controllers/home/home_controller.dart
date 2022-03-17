// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:invoice/app/data/product_data.dart';
import 'package:invoice/app/services/home_service.dart';

class HomeController extends GetxController {
  var productsList = [].obs;
  HomeService homeService = HomeService();
  ProductData productData = ProductData();

  getProducts() async {
    // var response = await homeService.getProducts();

    // productsList.addAll(response);
    productsList.addAll(productData.products);
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
