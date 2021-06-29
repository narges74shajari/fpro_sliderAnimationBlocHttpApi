
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:fpro_slideranimationbloc/models/product.dart';

class ProductService {
  static var _url =Uri.parse('http://95.216.69.11:3000/db.json');
  static Future browse() async {
    List collection;
    List<Product> _contacts;
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      _contacts = collection.map((json) => Product.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return _contacts;
  }
}