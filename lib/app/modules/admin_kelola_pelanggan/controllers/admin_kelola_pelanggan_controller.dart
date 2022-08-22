import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/user_model.dart';

class AdminKelolaPelangganController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final pemesanan = <UsersModel>[].obs;

  final CollectionReference getUsers =
      FirebaseFirestore.instance.collection('dataAdmin');

  // Stream<List<UsersModel>> getAllPemesanan() {
  //   return _firebaseFirestore
  //       .collection('dataAdmin')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => UsersModel.fromSnapshot(doc)).toList();
  //   });
  // }

  Future<void> deleteUsers(String dataUsersID) async {
    await getUsers.doc(dataUsersID).delete();

    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text('Berhasil Menghapus'),
    ));
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;

    // yield*
    _firebaseFirestore.collection("pesanan").get();
    // .doc('25:08$uid')
    // .snapshots();
  }
}
