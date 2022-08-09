// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

import '../controllers/create_user_controller.dart';

class CreateUserView extends GetView<CreateUserController> {
  @override
  Widget build(BuildContext context) {
    final cPW = Get.put(CreateUserController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            transformAlignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 85, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Daftar Akun',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  controller: controller.namaC,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.black,
                      ),
                      labelText: 'Nama',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.streetAddress,
                  controller: controller.alamatC,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_location_alt_outlined,
                        color: Colors.black,
                      ),
                      labelText: 'Alamat',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  controller: controller.nomorC,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.numbers_outlined,
                        color: Colors.black,
                      ),
                      labelText: 'Nomor Handphone',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailC,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => TextField(
                      obscureText: cPW.isHidden.value,
                      autocorrect: false,
                      controller: controller.passwordC,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffix: InkWell(
                            onTap: cPW.togglePasswordView,
                            child: Icon(
                              cPW.isHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          )),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 40,
                    width: double.infinity,
                    child: Obx(
                      () => RawMaterialButton(
                          onPressed: () async {
                            if (controller.isLoading.isFalse) {
                              controller.createUser();
                            }
                          },
                          child: Text(
                              controller.isLoading.isFalse
                                  ? 'Daftar Akun'
                                  : 'Loading...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat'))),
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Text('Sudah Punya Akun ?'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Get.toNamed(Routes.LOGIN),
                      child: const Text('Login',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
