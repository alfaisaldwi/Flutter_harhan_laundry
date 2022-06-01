import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/modules/admin_home/views/admin_home_view.dart';
import 'package:harhan_laundry/app/modules/user_home/views/user_home_view.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.CREATE_USER),
                icon: Icon(
                  Icons.person,
                )),
          ],
        ),
        body: 
        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: controller.streamRole(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              String role = snap.data!.data()!["role"];
              if (role == "admin") {
                return AdminHomeView();
              } else if (role == "user") {
                return UserHomeView();
              }
              return Center(
                child: Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }));
  }
}
