// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harhan_laundry/app/modules/create_user/controllers/create_user_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
          Container(
            transformAlignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Harhan",
                            style: GoogleFonts.poppins(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Text('Laundry',
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
            padding: EdgeInsets.only(top: 40, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailC,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
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
                TextField(
                  autocorrect: false,
                  controller: controller.passwordC,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: const Text('Lupa Password ?')),
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
                              await controller.login();
                            }
                          },
                          child: Text(
                              controller.isLoading.isFalse
                                  ? 'Login'
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
                const Text('Atau'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Get.toNamed(Routes.CREATE_USER),
                      child: const Text('Register',
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
