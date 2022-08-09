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
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Expanded(
                      child: Text(
                        'No.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'Nama',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    // Expanded(
                    //   child: Text(
                    //     'Harga  Total',
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       color: Colors.black54,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 5,
                    ),

                    SizedBox(
                      width: 5,
                    ),
                  ]),
              Flexible(
                child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("dataAdmin")
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      return ListView(
                        children: snapshot.data!.docs.map((e) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${i++}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        (e.data() as Map)["email"].toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        (e.data() as Map)["nama"].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    // Expanded(
                                    //   child: Text(
                                    //     (e.data() as Map)["checkout"]
                                    //             ["quantity"]
                                    //         .toString(),
                                    //     style: const TextStyle(
                                    //       fontSize: 12,
                                    //       color: Colors.black54,
                                    //     ),
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ]));
                        }).toList(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
