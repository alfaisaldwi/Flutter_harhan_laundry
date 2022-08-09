import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:harhan_laundry/app/modules/cart_laundry/views/cart_laundry_view.dart';
import 'package:harhan_laundry/app/modules/cart_laundry/views/cart_total.dart';

import '../controllers/cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartLaundryView(),
          // CartTotal()
        ],
      ),
    );
  }
}
