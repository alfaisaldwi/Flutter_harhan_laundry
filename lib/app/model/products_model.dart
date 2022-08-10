import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // Product's variables: name, price, imageUrl. All required.
  final int id;
  final String name;
  final int price;
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  static const List<Product> products = [
    Product(
        id: 1,
        name: 'Travel Bag',
        price: 50000,
        image: 'assets/image/bag_treatment/travel_bag.png'),
    Product(
        id: 2,
        name: 'Mountain Bag',
        price: 75000,
        image: 'assets/image/bag_treatment/mountain.png'),
    Product(
        id: 3,
        name: 'Backpack Bag',
        price: 30000,
        image: 'assets/image/bag_treatment/backpack.png'),
    Product(
        id: 4,
        name: 'Kids Bag',
        price: 15000,
        image: 'assets/image/bag_treatment/kids.png'),
    Product(
        id: 5,
        name: 'Clutch',
        price: 20000,
        image: 'assets/image/bag_treatment/clutch.png'),
    Product(
        id: 6,
        name: 'Wallet Canvas',
        price: 10000,
        image: 'assets/image/bag_treatment/wallet_canvas.png'),
    Product(
        id: 7,
        name: 'Wallet Leather',
        price: 15000,
        image: 'assets/image/bag_treatment/wallet_leather.png'),
    Product(
        id: 8,
        name: 'Diaper Bag',
        price: 45000,
        image: 'assets/image/bag_treatment/deaper.png'),
    Product(
        id: 9,
        name: 'Cap',
        price: 20000,
        image: 'assets/image/bag_treatment/cap.png'),
    Product(
        id: 10,
        name: 'Man Sandals',
        price: 40000,
        image: 'assets/image/sandal/mans_sandal.png'),
    
    Product(
        id: 13,
        name: 'Woman Sandals',
        price: 25000,
        image: 'assets/image/sandal/women.png'),
    Product(
        id: 14,
        name: 'Kids Sandals',
        price: 25000,
        image: 'assets/image/sandal/kids.png'),
    
  ];

  // static Product fromSnapshot(DocumentSnapshot snap) {
  //   Product product = Product(
  //     name: snap['name'],
  //     price: snap['price'],
  //     image: snap['image'],
  //   );
  //   return product;
  // }
}
