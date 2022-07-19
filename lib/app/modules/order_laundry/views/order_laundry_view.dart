// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/modules/cart_laundry/views/cart_laundry_view.dart';
import 'package:harhan_laundry/app/modules/order_laundry/views/list_product.dart';

import '../controllers/order_laundry_controller.dart';

class OrderLaundryView extends GetView<OrderLaundryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Laundry'), centerTitle: true, actions: [
          Badge(
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartLaundryView()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Atasan',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 19.0, horizontal: 10.0),
                  shrinkWrap: true,
                  itemCount: Atasan.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey.shade200,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 90,
                              width: 90,
                              image: AssetImage(Atasan[index].image),
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
                                        text: '${Atasan[index].name}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                        text: 'Unit: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text: '${Atasan[index].unit}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                        text: 'Price: ' r"$",
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${Atasan[index].price.toString()}\n',
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
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Underwear',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 19.0, horizontal: 8.0),
                  shrinkWrap: true,
                  itemCount: Underwear.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey.shade200,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 90,
                              width: 90,
                              image: AssetImage(Underwear[index].image),
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
                                        text: '${Underwear[index].name}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                        text: 'Unit: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text: '${Underwear[index].unit}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                        text: 'Price: ' r"$",
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${Underwear[index].price.toString()}\n',
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
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Aksesoris',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 19.0, horizontal: 8.0),
                  shrinkWrap: true,
                  itemCount: Aksesoris.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey.shade200,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 90,
                              width: 90,
                              image: AssetImage(Aksesoris[index].image),
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
                                        text: '${Aksesoris[index].name}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                        text: 'Unit: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text: '${Aksesoris[index].unit}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                        text: 'Price: ' r"$",
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${Aksesoris[index].price.toString()}\n',
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
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
