import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/products_model.dart';
import 'package:harhan_laundry/app/modules/status_laundry/views/status_laundry_view.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

import '../../../model/cart_laundry_controller.dart';

class CartLaundryView extends GetView<CartLaundryController> {
  var cartController = Get.put(CartLaundryController());
  final CartLaundryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.product != null) {
      return Obx(
        () => SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: controller.product.length,
            itemBuilder: ((context, index) {
              return CartProductCard(
                product: controller.product.keys.toList()[index],
                quantity: controller.product.values.toList()[index],
                index: index,
                controller: controller,
              );
            }),
          ),
        ),
      );
    } else {
      Container(
        child: Text('Kamu belum memasukan barang'),
      );
    }
    return CircularProgressIndicator();
  }
}

class CartProductCard extends GetView<CartLaundryController> {
  final CartLaundryController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(product.image),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(product.name),
              ),
              IconButton(
                onPressed: () {
                  controller.removeProduct(product);
                },
                icon: const Icon(Icons.remove_circle),
              ),
              Text('${quantity}'),
              IconButton(
                onPressed: () {
                  controller.addProduct(product);
                },
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '\ Rp.${controller.total.toString()}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () async {
              await controller.pesanan(product);
              print(product);
              controller.removeProduct(product);
              Get.snackbar("Berhasil", "Kamu telah mencheckout items");
              Get.toNamed(Routes.STATUS_LAUNDRY);
              // controller.deleteAllProducts();
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
