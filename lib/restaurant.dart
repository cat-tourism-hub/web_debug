import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String imageUrl;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            imageUrl,
            height: 100,
            width: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location),
                Text(price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
