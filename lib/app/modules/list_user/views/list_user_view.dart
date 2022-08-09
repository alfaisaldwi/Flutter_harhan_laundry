import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

import '../controllers/list_user_controller.dart';

class ListUserView extends GetView<ListUserController> {
  ListUserController lController = Get.put(ListUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListUserView'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              const CircularProgressIndicator();
            }
            if (snap.hasData) {
              Map<String, dynamic> user = snap.data!.data()!;
              return ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${user.toString().toUpperCase()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Tidak dapat memuat user'),
              );
            }
          }),
    );
  }
}
