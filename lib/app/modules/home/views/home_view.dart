import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harhan_laundry/app/modules/admin_home/views/admin_home_view.dart';
import 'package:harhan_laundry/app/modules/order_laundry/views/list_product.dart';
import 'package:harhan_laundry/app/modules/order_laundry/views/order_laundry_view.dart';
import 'package:harhan_laundry/app/modules/status_laundry/views/status_laundry_view.dart';
import 'package:harhan_laundry/app/modules/user_home/views/user_home_view.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';
import 'package:harhan_laundry/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Harhan Laundry'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.PROFILE),
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FeatureCard(
                          title: "Laundry",
                          text:
                              "Lakukan transaksi laundry dengan mudah serta dapat melihat harga layanan laundry",
                          gradient1: Color.fromARGB(132, 151, 71, 255),
                          gradient2: Color.fromARGB(113, 23, 136, 188),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          press: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return CatalogProducts();
                            //     },
                            //   ),
                            // );
                            Get.toNamed(Routes.CATALOG);
                          }),
                      FeatureCard(
                          title: "Cek Status Laundry",
                          text:
                              "Setelah memesan layanan laundry, silahkan cek status laundry disini.",
                          gradient1: Color(0xFFB6E9FF),
                          gradient2: Color(0xFFB6E9FF),
                          textColor: Color.fromARGB(125, 0, 0, 0),
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return StatusLaundryView();
                                },
                              ),
                            );
                          }),
                      // FeatureCard(
                      //     title: "Cek Sertifikat",
                      //     text:
                      //         "Setelah melakukan vaksin , anda dapat cek sertifikat vaksin disini.",
                      //     gradient1: Color(0xFFB6E9FF),
                      //     gradient2: Color(0xFFB6E9FF),
                      //     textColor: Color.fromARGB(125, 0, 0, 0),
                      //     press: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) {
                      //             return CertificateView();
                      //           },
                      //         ),
                      //       );
                      //     }),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      "Seputar Laundry",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 5),
                          InfoCard(
                              title: "Cara melakukan pemesanan laundry?",
                              press: () {
                                // showModalBottomSheet(
                                //   shape: const RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.vertical(
                                //         top: Radius.circular(40)),
                                //   ),
                                //   builder: (context) => ,
                                //   context: context,
                                // );
                              }),
                          const SizedBox(width: 5),
                          InfoCard(
                              title: "Promo laundry",
                              press: () {
                                // showModalBottomSheet(
                                //   shape: const RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.vertical(
                                //         top: Radius.circular(40)),
                                //   ),
                                //   builder: (context) => Article2View(),
                                //   context: context,
                                // );
                              }),
                          const SizedBox(width: 5),
                          InfoCard(title: "Jenis Deterjen ", press: () {}),
                          const SizedBox(width: 5),
                          InfoCard(title: "Paket Laundry", press: () {}),
                          const SizedBox(width: 5),
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
              ]))),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback? press;
  final Color color, textColor, gradient1, gradient2;
  const FeatureCard(
      {Key? key,
      required this.title,
      required this.text,
      required this.press,
      required this.gradient1,
      required this.gradient2,
      this.color = kPrimaryColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 95,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                width: 362,
                height: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [gradient1, gradient2]),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 24,
                      color: kShadowColor,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: kTitleTextstyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      // const Positioned(
                      //   top: 614,
                      //   width: 24,
                      //   height: 24,
                      //   left: 356,
                      //   child: Icon(Icons.arrow_right),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback? press;
  const InfoCard({
    Key? key,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 145,
        width: 148,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://s3-alpha-sig.figma.com/img/ac8d/80b9/4280245671bc75bd135e726d7990e5c6?Expires=1656288000&Signature=fqXXkg008kkg7gzAiKQlgg29s1X3E3nffxtpP~hCiPJWxfP40iKkl7APbU5McY1WDjuuqO5ec-se-VevVzn-LWCPmhvdIgaR7XlzMLVb5mHEG4gUdvg6~mBXus11IUsmvWt03gjnchXeO-N7IlWTgwoadj9D32lLiDXxVx6-9AW9T-3STSRRZkHojujOZQW95LUVBto7dhL3QlQhGh6UUCSqHBLskj7WrzXxKKH09Xq4-MqdR9wKGd-pf2bl~FCgmYvhJQd9wmQCzuf5QQdIJjhN198IpmqG1e3nygkwLfkCB7v1c-mIAcqSTVNiHgfRu8sXk-2sosbVvIzgEWepwA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
          ),
          border: Border.all(color: Color(0xFFC1E9FF)),
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                : BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                    color: kShadowColor,
                  ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
