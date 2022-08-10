import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/pemesanan_model.dart';

class AdminDataTransaksiController extends GetxController {
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

  void countDocuments() async {
    QuerySnapshot _myDoc = await _firebaseFirestore.collection('product').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    print(_myDocCount.length);  // Count of Documents in Collection
}
}
