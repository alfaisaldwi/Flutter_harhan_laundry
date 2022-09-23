import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/products_model.dart';
import 'package:intl/intl.dart';

class CartLaundryController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _product = {}.obs;

  Future<void> pesanan(Product product) async {
    String uid = auth.currentUser!.uid;
    var uidName = auth.currentUser!.email;

    CollectionReference<Map<String, dynamic>> colPesanan =
        await firestore.collection("pesanan").doc().collection("pesanan");
    QuerySnapshot<Map<String, dynamic>> snapPesanan = await colPesanan.get();
    // print();
    DateTime now = DateTime.now();
    String todayDocId = DateFormat.ms().format(now);
    String dym = DateFormat.yMd().format(now);

    if (snapPesanan.docs.isEmpty) {
      await firestore.collection("pesanan").doc().set({
        "uid": uid,
        "nameUid": uidName,
        "dateDetail": now.toIso8601String(),
        "date": dym,
        "items": product.name,
        "quantity": _product[product],
        "price": total,
        "status": "Belum diproses"
      });
      _product.remove(product);
    } else {
      DocumentSnapshot<Map<String, dynamic>> todayDoc =
          await colPesanan.doc().get();
      if (todayDoc.exists == true) {
        DateTime now = DateTime.now();
        String todayDocId2 = DateFormat.ms().format(now);
        var i = 1;
        colPesanan.doc().set({
          "uid": uid,
          "nameUid": uidName,
          "dateDetail": now.toIso8601String(),
          "date": dym,
          "items": product.name,
          "quantity": _product[product],
          "price": product.price.toDouble(),
          "status": "Belum diproses"
        });
      } else {
        colPesanan.doc().set({
          "uid": uid,
          "nameUid": uidName,
          "dateDetail": now.toIso8601String(),
          "date": dym,
          "items": product.name,
          "quantity": _product[product],
          "price": product.price.toDouble(),
          "status": "Belum diproses"
        });
      }
    }
  }

  void addProduct(Product product) {
    if (_product.containsKey(product)) {
      _product[product] += 1;
    } else {
      _product[product] = 1;
    }
    Get.snackbar("Laundry telah ditambahkan",
        "Kamu menambahkan ${product.name} ke keranjang",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  get product => _product;
  get productSubTotal => _product.entries
      .map((product) => product.key.price * product.value)
      .toList();
  get total => _product.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void removeProduct(Product product) {
    if (_product.containsKey(product) && _product[product] == 1) {
      _product.removeWhere(((key, value) => key == product));
    } else {
      _product[product] -= 1;
    }
  }

  void deleteAllProduct(Product product) {
    _product.clear;
  }
}
