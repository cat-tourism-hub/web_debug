import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourism_hub/Models/Establishment.dart';

final db = FirebaseFirestore.instance;

Future<List<Establishment>> fetchAllEstablishments() async {
  List<Establishment> establishments = [];
  CollectionReference collection = db.collection('establishment');

  var query = await collection.get();

  // Fetch all documents in the collection
  for (QueryDocumentSnapshot doc in query.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    establishments.add(Establishment.fromJson(data));
  }

  return establishments;
}

getAllRestaurant() async {
  List<Establishment> establishment = [];
  var collection = db.collection('establishment');

  var query = await collection.where('b_info.b_type',
      whereIn: ['Hotel & Restaurant', 'Restaurant']).get();

  for (QueryDocumentSnapshot doc in query.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    Map<String, dynamic> bInfo = data;

    establishment.add(Establishment.fromJson(bInfo));
  }
  return establishment;
}
