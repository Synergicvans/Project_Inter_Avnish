import 'package:a5_intern_vit/models/product_model.dart';
import 'package:a5_intern_vit/ui/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Image.network(
                product.images.isNotEmpty ? product.images[0] : '',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 50, color: Colors.grey);
                },
              ),
              SizedBox(height: 8),

              // Product Title
              Text(
                product.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Product Price
              Text(
                '\$${product.price}',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
