import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harhan_laundry/app/modules/login/views/login_view.dart';

class CreateUserController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController nomorC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var isHidden = true.obs;

  void togglePasswordView() => isHidden.value = !isHidden.value;

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
            "alamat": alamatC.text,
            "nohp": nomorC.text,
            "uid": uid,
            "role": "user",
            "createdAt": DateTime.now().toIso8601String()
          });

          await userCredential.user!.sendEmailVerification();
          Get.snackbar("Daftar Akun Sukses",
              "Silahkan Cek Email Verifikasi Kemudian Login");

          Navigator.push(
              Get.context!,
              MaterialPageRoute(
                builder: (context) => LoginView(),
              ));
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
