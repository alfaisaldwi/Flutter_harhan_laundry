import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_laundry_controller.dart';

class StatusLaundryView extends GetView<StatusLaundryController> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int i = 1;

  final pemesananController = Get.put(StatusLaundryController());
  @override
  Widget build(BuildContext context) {
    String uid = auth.currentUser!.uid;

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
                        'Tanggal',
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
                        'Laundry',
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
                        'Jumlah',
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
                        'Harga  Total',
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
                        'Status',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ]),
              Flexible(
                child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("pesanan")
                        .where("uid", isEqualTo: uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      return ListView(
                        children: snapshot.data!.docs.map((e) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
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
                                        (e.data() as Map)["date"],
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
                                        (e.data() as Map)["items"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        (e.data() as Map)["quantity"]
                                            .toString(),
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
                                        (e.data() as Map)["price"].toString(),
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
                                        (e.data() as Map)["status"].toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
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

// class CatalogProductCard extends GetView<StatusLaundryController> {
//   // var cartController = Get.put(CartLaundryController);
//   final StatusLaundryController statusLaundryController = Get.find();

//   final int index;
//   CatalogProductCard({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final cController = Get.find<StatusLaundryController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             flex: 2,
//             child: Text(
//               statusLaundryController.pemesanan[index].name,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               '\Rp ${statusLaundryController.pemesanan[index].price} k',
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
