import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_laundry_controller.dart';

class CartLaundryView extends GetView<CartLaundryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CartLaundryView'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey.shade200,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //  Image(
                        //    height: 80,
                        //    width: 80,
                        //    image:
                        //        AssetImage(provider.cart[index].image!),
                        //  ),
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
                                    text: 'Name: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          // text:      '${provider.cart[index].productName!}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
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
                                          //  text:
                                          //      '${provider.cart[index].unitTag!}\n',
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
                                          //  text:
                                          //      '${provider.cart[index].productPrice!}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red.shade800,
                            )),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
