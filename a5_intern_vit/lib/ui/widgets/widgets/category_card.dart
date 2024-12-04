import 'package:a5_intern_vit/models/category_model.dart';
import 'package:a5_intern_vit/ui/category_products_screen.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductsScreen(categoryId: category.id),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Category Image
              Image.network(
                category.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 50, color: Colors.grey);
                },
              ),
              SizedBox(width: 16),
              // Category Name
              Text(
                category.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
