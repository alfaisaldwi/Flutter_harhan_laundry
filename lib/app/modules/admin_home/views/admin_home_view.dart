import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AdminHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
