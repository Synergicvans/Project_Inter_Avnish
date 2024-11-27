import 'package:flutter/material.dart';
import '../data/product_service.dart';
import '../models/product.dart';

class ProductController extends ChangeNotifier {
  final ProductService _service = ProductService();
  List<Product> products = [];
  bool isLoading = false;

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      products = await _service.fetchProducts();
      print(products);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
