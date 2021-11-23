// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:invoice/constants/strings.dart';
import 'package:invoice/controllers/cart/cart_controller.dart';
import 'package:invoice/controllers/home/home_controller.dart';
import 'package:invoice/models/product.dart';
import 'package:invoice/views/home/widgets/home_page_bottom_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  CartController cartController = Get.put(CartController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text('Pdf Invoice with shopping cart'),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 25,
                ),
                Obx(
                  () => Text(
                    '${cartController.getTotalItemOnCart}',
                    style: TextStyle(
                      color: Colors.white,
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
                  child: homeController.productsList.isNotEmpty
                      ? StaggeredGridView.countBuilder(
                          padding: const EdgeInsets.all(8),
                          crossAxisCount: 4,
                          itemCount: homeController.productsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Product product =
                                homeController.productsList[index];
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[350]!,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            AppString.defaultProductImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${product.title}',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black87,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '\$${product.price}',
                                              style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            MaterialButton(
                                              color: Colors.teal,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              onPressed: () {
                                                cartController
                                                    .addToCart(product);
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.shopping_cart,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    'Add to Cart',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, 2.3),
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Loading Products...',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                ),
                HomePageBottomCard(
                  size: size,
                  cartController: cartController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
