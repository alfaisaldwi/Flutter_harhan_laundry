import 'package:get/get.dart';

import '../controllers/order_laundry_controller.dart';

class OrderLaundryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderLaundryController>(
      () => OrderLaundryController(),
    );
  }
}
