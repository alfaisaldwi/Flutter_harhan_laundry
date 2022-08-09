import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/user_model.dart';

class AdminKelolaPelangganController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final pemesanan = <UsersModel>[].obs;

  Stream<List<UsersModel>> getAllPemesanan() {
    return _firebaseFirestore
        .collection('dataAdmin')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UsersModel.fromSnapshot(doc)).toList();
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;

    // yield*
    _firebaseFirestore.collection("pesanan").get();
    // .doc('25:08$uid')
    // .snapshots();
  }
}
