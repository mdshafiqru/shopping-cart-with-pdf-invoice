// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:invoice/app/services/home_service.dart';

class HomeController extends GetxController {
  var productsList = [].obs;
  HomeService homeService = HomeService();

  getProducts() async {
    var response = await homeService.getProducts();
    productsList.addAll(response);
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
