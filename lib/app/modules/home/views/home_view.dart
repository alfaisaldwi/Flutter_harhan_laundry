import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.PROFILE),
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('ee'),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
