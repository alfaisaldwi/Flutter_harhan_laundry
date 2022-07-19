import 'package:get/get.dart';

import '../controllers/status_laundry_controller.dart';

class StatusLaundryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusLaundryController>(
      () => StatusLaundryController(),
    );
  }
}
