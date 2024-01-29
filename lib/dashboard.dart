import 'package:flutter/material.dart';
import 'package:tourism_hub/Models/Establishment.dart';
import 'package:tourism_hub/Query/db_query.dart';
import 'package:tourism_hub/accomodation.dart';
import 'package:tourism_hub/app_bar.dart';
import 'package:tourism_hub/car_rental.dart';
import 'package:tourism_hub/drawer.dart';
import 'package:tourism_hub/item_card.dart';
import 'package:tourism_hub/strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<Establishment> establishments;

  @override
  void initState() {
    super.initState();

    // Initialize the list
    establishments = [];

    // Call the function to fetch all establishments
    fetchAllEstablishments().then((fetchedEstablishments) {
      // Update the state with the fetched data
      setState(() {
        establishments = fetchedEstablishments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Accommodation Section
            SectionWithTitleAndButton(
              title: accomodation,
              buttonText: seeAll,
              children: [
                // Horizontal List View for Accommodation
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: establishments.length,
                      itemBuilder: (context, index) {
                        Establishment establishment = establishments[index];

                        //Check if the establishment type is equal to "accommodation"
                        if ((establishment.bType == 'Accommodation') ||
                            (establishment.bType == 'Hotel & Restaurant')) {
                          return AccommodationCard(
                            name: establishment.bName,
                            location:
                                '${establishment.location['barangay']}, ${establishment.location['municipality']}',
                            price: '\$100',
                            // Add image URL or asset path for each card
                            imageUrl: establishment.banner,
                          );
                        } else {
                          return const Center(child: Text('No data available'));
                        }
                      }),
                )
              ],
            ),

            //Restaurant Section
            SectionWithTitleAndButton(
              title: restaurant,
              buttonText: seeAll,
              children: [
                // Horizontal List View for Restaurants
                SizedBox(
                  height: 200,
                  child: FutureBuilder(
                      future: getAllRestaurant(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Establishment> data =
                              snapshot.data as List<Establishment>;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              Establishment establishment = data[index];
                              return AccommodationCard(
                                  name: establishment.bName,
                                  location:
                                      '${establishment.location['barangay']}, ${establishment.location['municipality']}',
                                  price: '\$100',
                                  // Add image URL or asset path for each card
                                  imageUrl: establishment.banner);
                            },
                          );
                        }
                        return const Center(child: Text('No data available'));
                      }),
                ),
              ],
            ),

            // Car Rentals Section
            SectionWithTitleAndButton(
              title: carRentals,
              buttonText: seeAll,
              children: [
                // Horizontal List View for Car Rentals
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CarRentalCard(
                        name: 'Car Rental $index',
                        location: 'Location $index',
                        price: '\$50/day',
                        // Add image URL or asset path for each card
                        imageUrl:
                            'https://via.placeholder.com/150x150.png?text=Image+${index + 1}',
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
