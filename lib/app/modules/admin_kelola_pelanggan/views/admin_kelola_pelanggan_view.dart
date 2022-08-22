import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_kelola_pelanggan_controller.dart';

class AdminKelolaPelangganView extends GetView<AdminKelolaPelangganController> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int i = 1;
  @override
  Widget build(BuildContext context) {
    String uid = auth.currentUser!.uid;
    final cPW = Get.put(AdminKelolaPelangganController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 50,
        title: const Center(
          child: Text(
            "Data Pelanggan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: cPW.getUsers.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];

                  return Card(
                    margin: const EdgeInsets.all(10),
                    
                    child: ListTile(
                      title: Text(
                          '${documentSnapshot['nama']} || ${documentSnapshot['email']}'),
                      subtitle: Text(
                          ' ${documentSnapshot['nohp']} || ${documentSnapshot['alamat']}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      cPW.deleteUsers(documentSnapshot.id))
                            ]),
                      ),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
