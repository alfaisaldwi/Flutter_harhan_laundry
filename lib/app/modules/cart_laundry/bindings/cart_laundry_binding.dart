import 'package:get/get.dart';

import '../controllers/cart_laundry_controller.dart';

class CartLaundryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartLaundryController>(
      () => CartLaundryController(),
    );
  }
}
