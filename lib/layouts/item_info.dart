import 'package:flutter/material.dart';
import 'package:tourism_hub/Models/Establishment.dart';
import 'package:tourism_hub/layouts/info_section.dart';
import 'package:tourism_hub/layouts/product_card.dart';

class ItemInfo extends StatefulWidget {
  const ItemInfo({super.key, required this.establishment});
  final Establishment establishment;

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.establishment.bName),
        elevation: 3,
        shadowColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Section 1: Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  widget.establishment.banner,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
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
              // Section 2: Establishment Info

              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Velit irure amet mollit exercitation laborum cillum tempor quis nulla anim deserunt sit ex. Id duis nulla veniam occaecat ea. Eiusmod ipsum velit deserunt consequat.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )),

              // Section 3: Establishment Details
              ItemInfoSection(title: 'Contact', icon: Icons.phone, children: [
                Row(children: [
                  const Icon(
                    Icons.email,
                    size: 15,
                  ),
                  Expanded(
                    child: Text(
                      ' ${widget.establishment.contact['email']}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]),
                Row(children: [
                  const Icon(
                    Icons.phone,
                    size: 15,
                  ),
                  Expanded(
                      child: Text(
                    ' ${widget.establishment.contact['phone']}',
                    overflow: TextOverflow.ellipsis,
                  )),
                ]),
                Row(children: [
                  const Icon(
                    Icons.language,
                    size: 15,
                  ),
                  Expanded(
                      child: Text(
                    ' ${widget.establishment.contact['website']}',
                    overflow: TextOverflow.ellipsis,
                  ))
                ])
              ]),

              ItemInfoSection(title: 'Location', icon: Icons.room, children: [
                Text(
                    '${widget.establishment.location['bldg']}, ${widget.establishment.location['barangay']}, ${widget.establishment.location['street']}, ${widget.establishment.location['municipality']}'),
              ]),

              // Section 3: Products
              ItemInfoSection(
                title: 'Rooms',
                icon: Icons.hotel,
                children: [
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ProductCard('Room 1'),
                        ProductCard('Room 2'),
                        ProductCard('Room 3'),
                        ProductCard('Room 4'),
                        ProductCard('Room 5'),
                        ProductCard('Room 6'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
