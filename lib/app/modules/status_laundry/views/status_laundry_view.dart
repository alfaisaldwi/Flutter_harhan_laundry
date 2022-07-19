import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_laundry_controller.dart';

class StatusLaundryView extends GetView<StatusLaundryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatusLaundryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatusLaundryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
