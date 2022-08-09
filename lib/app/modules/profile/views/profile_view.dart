import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil '),
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
                    children: [
                      ClipOval(
                        child: Container(
                          width: 90,
                          height: 90,
                          child: Image.network(
                            "https://ui-avatars.com/api/?name=${user['nama']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${user['nama'].toString().toUpperCase()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${user['email'].toString().toLowerCase()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                      leading: Icon(Icons.numbers_outlined),
                      title: Text('${user['nohp'].toString().toLowerCase()}')),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                      leading: Icon(Icons.location_pin),
                      title: Text('${user['alamat'].toString()}')),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                      onTap: () {
                        controller.Logout();
                      },
                      leading: Icon(Icons.logout),
                      title: Text('Logout')),
                  const SizedBox(
                    height: 5,
                  ),
                  if (user['role'] == 'admin')
                    ListTile(
                        onTap: () {
                          Get.toNamed(Routes.ADMIN_HOME);
                        },
                        leading: Icon(Icons.settings),
                        title: Text('Home Admin')),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
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
