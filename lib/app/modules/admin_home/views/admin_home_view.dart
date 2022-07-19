import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      color: Colors.white,
                      transformAlignment: Alignment.center,
                      child: Stack(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 100, 18, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Halaman Admin',
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    border: const Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text('Harhan Laundry',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    border: const Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  title: Text('Kelola Laundry'),
                                  trailing: Icon(Icons.arrow_forward_outlined),
                                ),
                                ListTile(
                                  title: Text('Daftar Pelanggan'),
                                  trailing: Icon(Icons.arrow_forward_outlined),
                                ),
                                ListTile(
                                  title: Text('Kembali ke Home'),
                                  trailing: Icon(Icons.arrow_forward_outlined),
                                  onTap: () => Get.toNamed(Routes.HOME),
                                ),
                              ]),
                        )
                      ]))
                ])));
  }
}
