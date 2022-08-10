import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/products_model.dart';
import 'package:harhan_laundry/app/model/cart_laundry_controller.dart';
import 'package:harhan_laundry/app/modules/cart_laundry/views/cart_laundry_view.dart';
import 'package:harhan_laundry/app/modules/cart_screen/views/cart_screen_view.dart';
import 'package:harhan_laundry/app/modules/catalog/controllers/catalog_controller.dart';

class Catalog extends GetView<CartLaundryController> {
  var cartController = Get.put(CartLaundryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreenView(),
                  ));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: const [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.white, size: 25)),
                ],
              ),
            ),
          )
        ],
        title: const Center(
          child: Text(
            "List Laundry",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: Product.products.length,
                itemBuilder: (context, index) {
                  return CatalogProductCard(
                    index: index,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class CatalogProductCard extends GetView<CartLaundryController> {
  var cartController = Get.put(CartLaundryController);

  final int index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cController = Get.find<CartLaundryController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              Product.products[index].image,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Text(
              Product.products[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '\Rp ${Product.products[index].price} ',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cController.addProduct(Product.products[index]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreenView(),
                  ));
              print(Product.products[index]);
              // Get.snackbar(
              //   'Product Added',
              //   'You have added the ${Product.products[index].name} to your cart!',
              //   messageText: Text(
              //     'You have added the ${Product.products[index].name} to your cart!',
              //     style: const TextStyle(
              //       fontSize: 17,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              //   snackPosition: SnackPosition.TOP,
              //   duration: const Duration(seconds: 1),
              //   backgroundColor: Colors.white,
              //   onTap: (_) {
              //     Get.to(
              //       () => CartLaundryView(),
              //       transition: Transition.cupertino,
              //     );
              //   },
              // );
            },
            icon: const Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
    );
  }
}
