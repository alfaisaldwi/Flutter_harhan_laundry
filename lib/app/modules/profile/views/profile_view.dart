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
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center();
            }
            Map<String, dynamic> user = snap.data!.data()!;
            return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                            "https://ui-avatars.com/api/?name=${user['nama']}"),
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
                  height: 20,
                ),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.person),
                    title: Text('Update Profile')),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.vpn_key),
                    title: Text('Ganti Password')),
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
                Text('${user['role']}'),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
    );
  }
}
