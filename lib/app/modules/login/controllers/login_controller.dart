import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController(); 
  var isHidden = true.obs;

  void togglePasswordView() => isHidden.value = !isHidden.value;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final UserCredential userCredential =
            await auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );
        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == true) {
            isLoading.value = false;

            Get.offAllNamed(Routes.HOME);
          } else {
            Get.defaultDialog(
                title: "Email Belum Terverifikasi",
                middleText:
                    "Kamu belum memverifikasi akun ini. Silahkan cek email dan lakukan verifikasi",
                actions: [
                  OutlinedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        isLoading.value = false;
                        Get.back();
                      }),
                  ElevatedButton(
                    child: const Text('Kirim Ulang Verifikasi'),
                    onPressed: () async {
                      try {
                        await userCredential.user!.sendEmailVerification();
                        Get.back();
                        Get.snackbar('Berhasil kirim ulang',
                            'Silahkan cek email dan lakukan verifikasi');
                        isLoading.value = false;
                      } catch (e) {
                        isLoading.value = false;
                        Get.snackbar('Terjadi kesalahan',
                            'Tidak dapat mengirim ulang verifikasi. Hubungi admin atau CS');
                      }
                    },
                  )
                ]);
          }
        }
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;

        if (e.code == 'wrong-password') {
          Get.snackbar("Terjadi Kesalahan", "Password Salah");
        } else {
          Get.snackbar(
              "Terjadi Kesalahan", "Periksa kembali email dan password");
        }
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat login");
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      Get.snackbar("Terjadi Kesalahan", "Email dan Password Wajib Diisi");
    }
  }
}
