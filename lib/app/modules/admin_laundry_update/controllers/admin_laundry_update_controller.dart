import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLaundryUpdateController extends GetxController {
  final selected = "Belum diproses".obs;
  TextEditingController statusL = TextEditingController();

  // Future<void> updateStatus([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //     statusL.text = documentSnapshot['checkout']['status'];
  //   }
  //   await showModalBottomSheet(
  //     context: Get.context!,
  //     builder: (BuildContext ctx){ 
  //       return Padding(padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: MediaQuery.of(ctx).viewInsets.bottom +20 ),child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           TextField(controller: statusL,
  //           decoration: const InputDecoration(labelText: 'Status'),),
  //           ElevatedButton(child: const Text('Ubah Status'),
  //           onPressed: ()async{
  //             final String status = statusL.text;
  //             await pe
  //           },)
          
  //       ]),)

  //     }
  //   )
  // }

  void setSelected(String value) {
    selected.value = value;
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Belum diproses"), value: "Belum diproses"),
      DropdownMenuItem(
          child: Text("Sedang diproses"), value: "Sedang diproses"),
      DropdownMenuItem(child: Text("Sudah selesai"), value: "Sudah selesai"),
    ];
    return menuItems;
  }

  var retriveData = FirebaseFirestore.instance
      .collection("pesanan")
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      FirebaseFirestore.instance
          .collection("pesanan")
          .doc(result.id)
          .get()
          .then((querySnapshot) {
        print(result.data());
      });
    });
  });

  // var rDataId = FirebaseFirestore.instance
  //     .collection("users")
  //     .get()
  //     .then((querySnapshot) {
  //   querySnapshot.docs.forEach((result) {
  //     FirebaseFirestore.instance
  //         .collection("")
  //         .doc(result.id)
  //         .collection("pets")
  //         .get()
  //         .then((querySnapshot) {
  //       querySnapshot.docs.forEach((result) {
  //         print(result.data());
  //       });
  //     });
  //   });
  // });
}
