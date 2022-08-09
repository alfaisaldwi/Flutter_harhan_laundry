import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/cart_laundry_controller.dart';

class CartTotal extends GetView<CartLaundryController> {
  final CartLaundryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.total != null) {
      return Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  // controller.deleteAllProducts();
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      );
    } else {
      Container();
    }
    return Container();
  }
}
