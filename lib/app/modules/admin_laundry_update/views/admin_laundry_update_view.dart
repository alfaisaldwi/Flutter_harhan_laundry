import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_laundry_update_controller.dart';

class AdminLaundryUpdateView extends GetView<AdminLaundryUpdateController> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = "Belum diproses";
    final cPW = Get.put(AdminLaundryUpdateController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Status Laundry'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Status Laundry',
              style: TextStyle(fontSize: 12),
            ),
            TextField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              controller: controller.statusL,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Colors.black,
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )),
            ),
            ElevatedButton(
                child: Text('Update Status'),
                onPressed: () {
                  cPW.retriveData;
                })
          ],
        ),
      ),
    );
  }
}
