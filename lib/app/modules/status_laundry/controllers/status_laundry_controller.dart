import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/pemesanan_model.dart';

class StatusLaundryController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final pemesanan = <Pemesanan>[].obs;
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
    _firebaseFirestore.collection("dataAdmin").get();
    // .doc('25:08$uid')
    // .snapshots();
  }

  @override
  void onInit() {
    pemesanan.bindStream(getAllPemesanan());
    super.onInit();
  }
}
