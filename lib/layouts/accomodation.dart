import 'package:flutter/material.dart';
import 'package:tourism_hub/layouts/base_card.dart';

class AccommodationCard extends BaseCard {
  const AccommodationCard(
      {super.key, required super.establishment, super.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 3,
        child: Stack(alignment: Alignment.center, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                establishment.banner,
                width: 150,
                height: 100,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Change to MainAxisSize.min
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(establishment.bName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                        width: 130,
                        child: Text(
                          '${establishment.location['barangay']}, ${establishment.location['municipality']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
