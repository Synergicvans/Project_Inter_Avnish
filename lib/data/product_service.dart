import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String _url = "https://api.escuelajs.co/api/v1/products";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data
            .where((json) => json['id'] >= 25 && json['id'] <= 135) // Filter IDs
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      rethrow;
    }
  }
}
