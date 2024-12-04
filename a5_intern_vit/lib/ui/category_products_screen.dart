import 'package:a5_intern_vit/ui/widgets/widgets/product_card_with_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class CategoryProductsScreen extends StatefulWidget {
  final int categoryId;

  CategoryProductsScreen({required this.categoryId});

  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProductsByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.products.isEmpty) {
            return Center(child: Text('No products available.'));
          }
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: provider.products[index]);
            },
          );
        },
      ),
    );
  }
}
