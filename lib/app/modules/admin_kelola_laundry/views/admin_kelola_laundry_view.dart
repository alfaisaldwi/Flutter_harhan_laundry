import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/modules/admin_laundry_update/controllers/admin_laundry_update_controller.dart';
import 'package:harhan_laundry/app/modules/admin_laundry_update/views/admin_laundry_update_view.dart';

import '../controllers/admin_kelola_laundry_controller.dart';

class AdminKelolaLaundryView extends GetView<AdminKelolaLaundryController> {
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
        body:
            //  Center(
            // child: SafeArea(
            //   child: Column(
            //     children: [
            //       Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: const [
            //             Expanded(
            //               child: Text(
            //                 'No.',
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Expanded(
            //               child: Text(
            //                 'Tanggal',
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Expanded(
            //               child: Text(
            //                 'Laundry',
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Expanded(
            //               child: Text(
            //                 'Harga  Total',
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Expanded(
            //               child: Text(
            //                 'Status',
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Expanded(
            //               child: Text(
            //                 'Aksi',
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //           ]),
            StreamBuilder(
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
                      child: ListTile(
                        title: Text(
                            '${documentSnapshot['date']} || ${documentSnapshot['items']}'),
                        subtitle: Text(
                            ' ${documentSnapshot['nameUid']}|| ${documentSnapshot['status']}'),
                        trailing: SizedBox(
                          width: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () =>
                                        cPW.updateStatus(documentSnapshot)),
                              ]),
                        ),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        )
        // Flexible(
        //   child: FutureBuilder<QuerySnapshot>(
        //       future:
        //           FirebaseFirestore.instance.collection("pesanan").get(),
        //       builder: (context, snapshot) {
        //         if (!snapshot.hasData) {
        //           return CircularProgressIndicator();
        //         }

        //         return ListView(
        //           children: snapshot.data!.docs.map((e) {
        //             return Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 5.0, vertical: 5.0),
        //                 child: Column(children: [
        //                   Row(
        //                     mainAxisAlignment:
        //                         MainAxisAlignment.spaceEvenly,
        //                     children: [
        //                       Expanded(
        //                         child: Text(
        //                           '${i++}',
        //                           style: const TextStyle(
        //                             fontSize: 12,
        //                             color: Colors.black54,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 5,
        //                       ),
        //                       Expanded(
        //                         child: Text(
        //                           (e.data() as Map)["checkout"]["date"],
        //                           style: const TextStyle(
        //                             fontSize: 12,
        //                             color: Colors.black54,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 5,
        //                       ),
        //                       GestureDetector(
        //                         onTap: () {
        //                           Get.to(() => AdminLaundryUpdateView());
        //                         },
        //                         child: Expanded(
        //                           flex: 2,
        //                           child: Text(
        //                             (e.data() as Map)["checkout"]
        //                                 ["items"],
        //                             style: const TextStyle(
        //                               fontWeight: FontWeight.bold,
        //                               fontSize: 12,
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 5,
        //                       ),
        //                       Expanded(
        //                         child: Text(
        //                           (e.data() as Map)["checkout"]["price"]
        //                               .toString(),
        //                           style: const TextStyle(
        //                             fontSize: 12,
        //                             color: Colors.black54,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 5,
        //                       ),
        //                       Expanded(
        //                         child: Text(
        //                           (e.data() as Map)["checkout"]["status"]
        //                               .toString(),
        //                           style: const TextStyle(
        //                             fontSize: 12,
        //                             color: Colors.black54,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 5,
        //                       ),
        //                       Expanded(
        //                         child: Text(
        //                           (e.data() as Map)["checkout"]["status"]
        //                               .toString(),
        //                           style: const TextStyle(
        //                             fontSize: 12,
        //                             color: Colors.black54,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ]));
        //           }).toList(),
        //         );
        //       }),
        // ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
