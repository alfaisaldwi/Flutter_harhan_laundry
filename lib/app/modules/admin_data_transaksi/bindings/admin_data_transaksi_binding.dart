import 'package:get/get.dart';

import '../controllers/admin_data_transaksi_controller.dart';

class AdminDataTransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDataTransaksiController>(
      () => AdminDataTransaksiController(),
    );
  }
}
