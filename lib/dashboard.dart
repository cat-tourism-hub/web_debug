import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tourism_hub/Models/establishment.dart';
import 'package:tourism_hub/Providers/authenticated_user.dart';
import 'package:tourism_hub/Providers/establishment_list.dart';
import 'package:tourism_hub/Providers/internet_connection.dart';
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
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<EstablishmentProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);

    provider.fetchEstablishment();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<EstablishmentProvider, InternetConnectionProvider>(
      builder: (context, value, internet, child) {
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
                  title: labelAccommodation,
                  buttonText: labelSeeAll,
                  children: [
                    SizedBox(
                      height: 220,
                      child: value.accommodations.isEmpty
                          ? const Center(
                              child: Text('No accommodations available.'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.accommodations.length,
                              itemBuilder: (context, index) {
                                Establishment establishment =
                                    value.accommodations[index];
                                Alignment alignment = Alignment(
                                    (index / value.accommodations.length * 2) -
                                        1.0,
                                    0.0);
                                return AccommodationCard(
                                    establishment: establishment,
                                    onTap: () {
                                      Navigator.of(context).push(PageTransition(
                                          type: PageTransitionType.scale,
                                          alignment: alignment,
                                          child: ItemInfo(
                                              type: labelAccommodation,
                                              establishment: establishment),
                                          duration:
                                              const Duration(milliseconds: 400),
                                          childCurrent: widget));
                                    });
                              }),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                //Restaurant Section
                SectionWithTitleAndButton(
                  title: labelRestaurant,
                  buttonText: labelSeeAll,
                  children: [
                    SizedBox(
                      height: 220,
                      child: value.restaurants.isEmpty
                          ? const Center(
                              child: Text('No restaurants available.'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.restaurants.length,
                              itemBuilder: (context, index) {
                                Establishment establishment =
                                    value.restaurants[index];
                                Alignment alignment = Alignment(
                                    (index / value.restaurants.length * 2) -
                                        1.0,
                                    0.0);

                                return RestaurantCard(
                                    establishment: establishment,
                                    onTap: () {
                                      Navigator.of(context).push(PageTransition(
                                          type: PageTransitionType.scale,
                                          alignment: alignment,
                                          child: ItemInfo(
                                              type: labelRestaurant,
                                              establishment: establishment),
                                          duration:
                                              const Duration(milliseconds: 400),
                                          childCurrent: widget));
                                    });
                              }),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Car Rentals Section
                SectionWithTitleAndButton(
                  title: labelCarRentals,
                  buttonText: labelSeeAll,
                  children: [
                    SizedBox(
                      height: 200,
                      child: value.carRental.isEmpty
                          ? const Center(
                              child: Text('No car rental available.'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.carRental.length,
                              itemBuilder: (context, index) {
                                Establishment establishment =
                                    value.carRental[index];

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
      },
    );
  }
}
