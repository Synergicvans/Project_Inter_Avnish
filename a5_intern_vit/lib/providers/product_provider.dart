import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Category> _categories = [];
  bool _isLoading = true;

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      notifyListeners();
      _products = await ApiService().fetchProducts();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategories() async {
    try {
      _isLoading = true;
      notifyListeners();
      _categories = await ApiService().fetchCategories();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsByCategory(int categoryId) async {
    try {
      _isLoading = true;
      notifyListeners();
      _products = await ApiService().fetchProductsByCategory(categoryId);
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
