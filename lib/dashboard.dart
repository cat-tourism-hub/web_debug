import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tourism_hub/Models/Establishment.dart';
import 'package:tourism_hub/Query/db_query.dart';
import 'package:tourism_hub/layouts/car_rental.dart';
import 'package:tourism_hub/layouts/item_info.dart';
import 'package:tourism_hub/layouts/restaurant.dart';
import 'package:tourism_hub/strings.dart';

import 'layouts/accomodation.dart';
import 'layouts/app_bar.dart';
import 'layouts/drawer.dart';
import 'layouts/section.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<Establishment> accommodations = [];
  late List<Establishment> restaurants = [];
  late List<Establishment> carRental = [];

  @override
  void initState() {
    fetchAllEstablishments().then((fetchedEstablishments) {
      setState(() {
        for (var est in fetchedEstablishments) {
          if (est.bType == 'Hotel & Restaurant' ||
              est.bType == 'Accommodation') {
            accommodations.add(est);
          }

          if (est.bType == 'Restaurant' || est.bType == 'Hotel & Restaurant') {
            restaurants.add(est);
          }

          if (est.bType == 'Car Rental') {
            carRental.add(est);
          }
        }
      });
    });
    super.initState();
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
                SizedBox(
                  height: 220,
                  child: accommodations.isEmpty
                      ? const Center(
                          child: Text('No accommodations available.'))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: accommodations.length,
                          itemBuilder: (context, index) {
                            Establishment establishment = accommodations[index];

                            return AccommodationCard(
                                establishment: establishment,
                                onTap: () {
                                  Navigator.of(context).push(PageTransition(
                                      type:
                                          PageTransitionType.rightToLeftJoined,
                                      child: ItemInfo(
                                          establishment: establishment),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      reverseDuration:
                                          const Duration(milliseconds: 300),
                                      childCurrent: widget));
                                });
                          }),
                )
              ],
            ),
            const SizedBox(height: 10),
            //Restaurant Section
            SectionWithTitleAndButton(
              title: restaurant,
              buttonText: seeAll,
              children: [
                SizedBox(
                  height: 220,
                  child: restaurants.isEmpty
                      ? const Center(child: Text('No restaurants available.'))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurants.length,
                          itemBuilder: (context, index) {
                            Establishment establishment = restaurants[index];

                            return RestaurantCard(
                              name: establishment.bName,
                              location:
                                  '${establishment.location['barangay']}, ${establishment.location['municipality']}',
                              imageUrl: establishment.banner,
                            );
                          }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Car Rentals Section
            SectionWithTitleAndButton(
              title: carRentals,
              buttonText: seeAll,
              children: [
                SizedBox(
                  height: 200,
                  child: carRental.isEmpty
                      ? const Center(child: Text('No car rental available.'))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: carRental.length,
                          itemBuilder: (context, index) {
                            Establishment establishment = carRental[index];

                            return CarRentalCard(
                              name: establishment.bName,
                              location:
                                  '${establishment.location['barangay']}, ${establishment.location['municipality']}',
                              price: '100/day',
                              imageUrl: establishment.banner,
                            );
                          }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
