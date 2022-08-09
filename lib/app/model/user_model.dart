
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  // Pemesanan's variables: name, price, imageUrl. All required.
  final String uid;
  final String name;
  final String role;
  final String email;




  const UsersModel({
    required this.uid,
    required this.name,
    required this.role,
    required this.email,
  });
  static UsersModel fromSnapshot(DocumentSnapshot snap) {
    UsersModel userModel = UsersModel(
      uid: snap['uid'],
      name: snap['name'],
      role: snap['role'],
      email: snap['email'],

    );
    return userModel;
  }
}
