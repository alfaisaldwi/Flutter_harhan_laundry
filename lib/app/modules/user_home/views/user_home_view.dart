import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_home_controller.dart';

class UserHomeView extends GetView<UserHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserHomeView'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
              child: Column(children: [
            // Obx(() => CarouselSlider(
            //               options: CarouselOptions(
            //                 height: 200.0,
            //                 autoPlay: true,
            //                 autoPlayInterval: Duration(seconds: 3),
            //                 autoPlayAnimationDuration: Duration(milliseconds: 800),
            //                 autoPlayCurve: Curves.fastOutSlowIn,
            //                 pauseAutoPlayOnTouch: true,
            //                 aspectRatio: 2.0,
            //                 onPageChanged: (index, reason) {
            //                   setState(() {
            //                     _currentIndex = index;
            //       });
            //     },
            //   ),
            //   items: cardList.map((card) {
            //     return Builder(builder: (BuildContext context) {
            //       return Container(
            //         height: MediaQuery.of(context).size.height * 0.30,
            //         width: MediaQuery.of(context).size.width,
            //         child: Card(
            //           color: Colors.blueAccent,
            //           child: card,
            //         ),
            //       );
            //     });
            //   }).toList(),
            // ),
            // )
            ]
        ),
      ),
    );
  }
}
