import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      product.images.isNotEmpty ? product.images[0] : '',
                      width: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Handle image loading error
                        return Icon(Icons.error, size: 50);
                      },
                    ),
                    title: Text(product.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: ₹${product.price}'),
                        // Text('Category: ${product.category.name}'),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(product.title),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(product.description),
                              // Display images safely, avoiding null or errors
                              ...product.images.map((image) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Image.network(
                                      image,
                                      height: 100,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child; // Show image once loaded
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        ); // Show loading indicator while image loads
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(Icons.error,
                                            size:
                                                100); // Fallback if image fails
                                      },
                                    ));
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchProducts,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
