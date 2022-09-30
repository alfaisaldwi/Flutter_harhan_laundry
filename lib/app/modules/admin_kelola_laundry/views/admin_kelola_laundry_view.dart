import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

import '../controllers/admin_kelola_laundry_controller.dart';

class AdminKelolaLaundryView extends GetView<AdminKelolaLaundryController> {
  AdminKelolaLaundryController statusC = AdminKelolaLaundryController();
  FirebaseAuth auth = FirebaseAuth.instance;

  int i = 1;
  @override
  Widget build(BuildContext context) {
    var getUid = FirebaseFirestore.instance.collection('dataAdmin');
    String uid = auth.currentUser!.uid;
    final cPW = Get.put(AdminKelolaLaundryController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          toolbarHeight: 50,
          title: const Center(
            child: Text(
              "Stasus Pemesanan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: cPW.getPesanan.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                '${documentSnapshot['date']} || ${documentSnapshot['items']}'),
                            subtitle: Text(
                                ' ${documentSnapshot['nameUid']} || ${documentSnapshot['status']}'),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () =>
                                            cPW.updateStatus(documentSnapshot)),
                                    IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () => cPW
                                            .deleteLaundry(documentSnapshot.id))
                                  ]),
                            ),
                          ),
                          // Text('${documentSnapshot['status']}')
                        ],
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
