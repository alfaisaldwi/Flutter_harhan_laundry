import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/pemesanan_model.dart';
import 'package:harhan_laundry/app/model/products_model.dart';

class AdminKelolaLaundryController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController statusL = TextEditingController();
  // AdminKelolaLaundryController controller = AdminKelolaLaundryController();

  ///

  var selectedDrowpdown = '';

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final pemesanan = <Pemesanan>[].obs;

  final CollectionReference getPesanan =
      FirebaseFirestore.instance.collection('pesanan');

  Future<void> updateStatus([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      statusL.text = documentSnapshot['status'].toString();
    }
    await showModalBottomSheet(
        context: Get.context!,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "Belum diproses",
                      "Barang Sedang diambil ke Alamat",
                      "Barang sudah diterima dan akan diproses",
                      'Sedang diproses',
                      'Barang dikirim ke alamat',
                      'Laundry selesai'
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Menu mode",
                        hintText: "country in menu mode",
                      ),
                    ),
                    onChanged: (value) {
                      selectedDrowpdown = value!;
                    },
                    // (ubahStatus(documentSnapshot!.id)),
                    selectedItem: "${statusL.text}",
                  ),
                  // TextField(
                  //   controller: statusL,
                  //   decoration: const InputDecoration(labelText: 'Status'),
                  // ),
                  ElevatedButton(
                    child: const Text('Ubah Status'),
                    onPressed: () async {
                      final String status = selectedDrowpdown;
                      await getPesanan
                          .doc(documentSnapshot?.id)
                          .update({"status": status});
                      Navigator.pop(ctx);
                    },
                  )
                ]),
          );
        });
  }

  void ubahStatus([DocumentSnapshot? documentSnapshot]) async {
    await getPesanan.doc(documentSnapshot?.id).update({"status": statusL});
  }

  Future<void> deleteLaundry(String dataPesananID) async {
    await getPesanan.doc(dataPesananID).delete();

    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text('Berhasil Menghapus'),
    ));
  }

  Stream<List<Pemesanan>> getAllPemesanan() {
    return _firebaseFirestore
        .collection('dataAdmin')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Pemesanan.fromSnapshot(doc)).toList();
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;

    // yield*
    _firebaseFirestore.collection("pesanan").get();
    // .doc('25:08$uid')
    // .snapshots();
  }

  //  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
  //   String action = 'create';
  //   if (documentSnapshot != null) {
  //     action = 'update';
  //     _nameController.text = documentSnapshot['name'];
  //     _priceController.text = documentSnapshot['price'].toString();
  //   }
  void getIdLaundry() {
    FirebaseFirestore.instance.collection("pesanan").id;
  }
}
