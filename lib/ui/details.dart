import 'package:flutter/material.dart';

import '../model/Products.dart';



class ProductDetailScreen extends StatelessWidget {
  final Products product; // Pass the selected product as a parameter

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('${product.thumbnail}'),
            Text('Title: ${product.title}'),
            Text('Description: ${product.description}'),
            Text('Price: \$${product.price}'),
            Text('Discount Percentage: ${product.discountPercentage}%'),
            Text('Rating: ${product.rating}'),
            Text('Stock: ${product.stock}'),
            Text('Brand: ${product.brand}'),
          ],
        ),
      ),
    );
  }
}
