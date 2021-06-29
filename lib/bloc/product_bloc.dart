
import 'dart:async';

import 'package:fpro_slideranimationbloc/models/product.dart';
import 'package:fpro_slideranimationbloc/services/product_service.dart';

class ProductBLoc {
  Stream<List<Product>> get productsList async* {
    yield await ProductService.browse();
  }

  final StreamController<int> _ProductCounter = StreamController<int>();

  Stream<int> get productCounter => _ProductCounter.stream;

  ProductBLoc() {
    productsList.listen((list) => _ProductCounter.add(list.length));
  }
}
