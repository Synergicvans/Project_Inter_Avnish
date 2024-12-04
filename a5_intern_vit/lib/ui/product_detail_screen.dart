import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Carousel
            SizedBox(
              height: 300,
              child: PageView.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        product.images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, size: 50, color: Colors.grey);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            // Product Title
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Product Price
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Product Description
            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
