import 'package:flutter/material.dart';

class ProductImagesWidget extends StatefulWidget {
  @override
  _ProductImagesWidgetState createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<ProductImagesWidget> {
  // Sample image URLs, including an invalid one
  List<String> imageUrls = [
    "https://placeimg.com/640/480/any",      // valid
    "https://i.imgur.com/5B8UQfh.jpeg",      // valid
    "https://invalid-url.com/invalid.jpg",   // invalid
    "https://placeimg.com/640/480/tech",     // valid
  ];

  // List to store the URLs of images that failed to load
  List<String> failedUrls = [];

  // Function to handle image loading error
  void onImageError(String url) {
    setState(() {
      // If the image failed to load, remove it from the list
      failedUrls.add(url);
      imageUrls.remove(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: imageUrls.map((url) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            url,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;  // Image loaded successfully
              } else {
                return Center(child: CircularProgressIndicator()); // Loading indicator
              }
            },
            errorBuilder: (context, error, stackTrace) {
              // Handle image loading error
              onImageError(url);  // Remove the failed image
              return Center(child: Icon(Icons.error)); // Show an error icon
            },
          ),
        );
      }).toList(),
    );
  }
}
