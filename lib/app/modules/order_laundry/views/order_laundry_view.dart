// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:harhan_laundry/app/modules/status_laundry/views/status_laundry_view.dart';
import 'package:harhan_laundry/app/routes/app_pages.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:get/get.dart';
import 'package:harhan_laundry/app/modules/cart_laundry/views/cart_laundry_view.dart';
import 'package:harhan_laundry/app/modules/order_laundry/views/list_product.dart';

import '../controllers/order_laundry_controller.dart';

class OrderLaundryView extends GetView<OrderLaundryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => Cartzz(),
              //     ));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.blue, size: 25)),
                  // Positioned(
                  //   top: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: GetBuilder<AddToCartVM>(
                  //     // specify type as Controller
                  //     init: AddToCartVM(), // intialize with the Controller
                  //     builder: (value) => CartCounter(
                  //       count: value.lst.length.toString() ?? "0",
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: Center(
          child: Text(
            "My Mart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image(
                      height: 90,
                      width: 90,
                      image: AssetImage(items[index].image),
                    ),
                    SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                                text: '${items[index].name}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Price: ',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text: '${items[index].price}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey.shade900),
                        onPressed: () {
                          //  saveData(index);
                        },
                        child: const Text('Add to Cart')),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
