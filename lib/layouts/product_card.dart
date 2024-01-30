import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;

  const ProductCard(this.productName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 300,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          productName,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
