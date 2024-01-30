import 'package:flutter/material.dart';

class CarRentalCard extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String imageUrl;

  const CarRentalCard({
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
      child: Stack(alignment: Alignment.center, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                imageUrl,
                height: 100,
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const SizedBox(
                      height: 100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Error loading image')));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 130, child: Text(location)),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
