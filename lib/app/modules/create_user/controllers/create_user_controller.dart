import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserController extends GetxController {
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createUser() async {
    if (namaC.text.isNotEmpty && emailC.text.isNotEmpty) {
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;

          await firestore.collection("dataAdmin").doc(uid).set({
            "nama": namaC.text,
            "email": emailC.text,
            "uid": uid,
            "createdAt": DateTime.now().toIso8601String()
          });
          
          await userCredential.user!.sendEmailVerification();
        }

        print(userCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Terjadi Kesalahan", "Email tidak terdaftar");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Terjadi Kesalahan", "Password yang anda masukan salah");
        }
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat login");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Nama dan Email harus diisi");
    }
  }
}
