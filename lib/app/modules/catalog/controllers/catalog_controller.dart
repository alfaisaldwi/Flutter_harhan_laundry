import 'package:get/get.dart';
import 'package:harhan_laundry/app/model/products_model.dart';

class CatalogController extends GetxController {
  final _product = {}.obs;

  void addProduct(Product product) {
    if (_product.containsKey(product)) {
      _product[product] += 1;
    } else {
      _product[product] = 1;
    }
  }
}
