import 'package:get/get.dart';

import '../controllers/admin_kelola_laundry_controller.dart';

class AdminKelolaLaundryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminKelolaLaundryController>(
      () => AdminKelolaLaundryController(),
    );
  }
}
