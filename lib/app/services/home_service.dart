import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:invoice/app/data/constants/api_strings.dart';
import 'package:invoice/app/models/product.dart';

class HomeService {
  Future<List<Product>> getProducts() async {
    List<Product> productsList = [];
    var url = Uri.parse(ApiString.PRODUCT_URL);

    try {
      var response = await http.get(
        url,
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body)['data'];

        for (var item in jsonData) {
          productsList.add(Product.fromJson(item));
        }
      }
    } catch (e) {
      //
    }

    return productsList;
  }

  // Future<ApiResponse> getProducts() async {
  //   ApiResponse apiResponse = ApiResponse();
  //   try {
  //     final response =
  //         await http.get(Uri.parse(ApiString.PRODUCT_URL), headers: {
  //       'Accept': 'application/json',
  //     });

  //     if (response.statusCode == 200) {
  //       List productList = [];

  //       // var productResponse = jsonDecode(response.body)['data'];
  //       var productResponse = json.decode(response.body)['data'];
  //       // .map((p) => Product.fromJson(p))
  //       // .toList();

  //       for (var item in productResponse) {
  //         productList.add(Product.fromJson(item));
  //         print(productList.length);
  //       }

  //       // for (var item in productResponse) {
  //       //   productList.add(Product.fromJson(item));
  //       // }

  //       print('working');

  //       // apiResponse.data = jsonDecode(response.body)['data']
  //       //     .map((p) => Product.fromJson(p))
  //       //     .toList();

  //       apiResponse.data as List<dynamic>;
  //     } else {
  //       print('else block');
  //       apiResponse.error = AppString.SOMETHING_WENT_WRONG;
  //     }
  //     // if (response.statusCode == 200) {
  //     //   apiResponse.data = jsonDecode(response.body)['data']
  //     //       .map((p) => Product.fromJson(p))
  //     //       .toList();

  //     //   apiResponse.data as List<Product>;
  //     // } else {
  //     //   apiResponse.error = AppString.SOMETHING_WENT_WRONG;
  //     //   print('else block');
  //     // }
  //   } catch (e) {
  //     // apiResponse.error = AppString.SERVER_ERROR;
  //   }

  //   return apiResponse;
  // }
}
