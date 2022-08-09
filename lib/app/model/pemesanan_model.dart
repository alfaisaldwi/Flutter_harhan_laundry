import 'package:cloud_firestore/cloud_firestore.dart';

class Pemesanan {
  // Pemesanan's variables: name, price, imageUrl. All required.
  final int id;
  final String name;
  final int price;

  const Pemesanan({
    required this.id,
    required this.name,
    required this.price,
  });
  static Pemesanan fromSnapshot(DocumentSnapshot snap) {
    Pemesanan pemesanan = Pemesanan(
      id: snap['id'],
      name: snap['name'],
      price: snap['price'],
    );
    return pemesanan;
  }
}
