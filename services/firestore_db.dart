// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:harhan_laundry/app/model/products_model.dart';



// class FirestoreDB {
//   // Initialise Firebase Cloud Firestore

//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   Stream<List<Product>> getAllProducts() {
//     return _firebaseFirestore
//         .collection('products')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map<Product>((doc) => Product.fromSnapshot(doc))
//           .toList();
//     });
//   }
// }
