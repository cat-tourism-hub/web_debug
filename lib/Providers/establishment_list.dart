import 'package:flutter/material.dart';
import 'package:tourism_hub/Models/establishment.dart';
import 'package:tourism_hub/Query/db_query.dart';

class EstablishmentProvider extends ChangeNotifier {
  List<Establishment> accommodations = [];
  List<Establishment> restaurants = [];
  List<Establishment> carRental = [];

  fetchEstablishment() async {
    List establishmentList = await fetchAllEstablishments();

    for (var est in establishmentList) {
      if (est.bType == 'Hotel & Restaurant' || est.bType == 'Accommodation') {
        accommodations.add(est);
      }

      if (est.bType == 'Restaurant' || est.bType == 'Hotel & Restaurant') {
        restaurants.add(est);
      }

      if (est.bType == 'Car Rental') {
        carRental.add(est);
      }
    }

    notifyListeners();
  }
}
