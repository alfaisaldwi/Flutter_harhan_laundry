import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  final cardList = RxList<Image>([
    Image.network("https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
    Image.network("https://picsum.photos/id/237/200/300"),
    Image.network("https://picsum.photos/id/739/200/300"),
  ]);
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
