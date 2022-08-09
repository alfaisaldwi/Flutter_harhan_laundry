import 'package:get/get.dart';

import '../controllers/admin_laundry_update_controller.dart';

class AdminLaundryUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLaundryUpdateController>(
      () => AdminLaundryUpdateController(),
    );
  }
}
