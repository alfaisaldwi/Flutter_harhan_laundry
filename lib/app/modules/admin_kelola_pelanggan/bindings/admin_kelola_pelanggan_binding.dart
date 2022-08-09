import 'package:get/get.dart';

import '../controllers/admin_kelola_pelanggan_controller.dart';

class AdminKelolaPelangganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminKelolaPelangganController>(
      () => AdminKelolaPelangganController(),
    );
  }
}
