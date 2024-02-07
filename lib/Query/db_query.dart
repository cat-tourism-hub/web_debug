import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourism_hub/Models/establishment.dart';

final db = FirebaseFirestore.instance;
CollectionReference collection = db.collection('establishment');

Future<List<Establishment>> fetchAllEstablishments() async {
  List<Establishment> establishments = [];
  try {
    var query = await collection.get();

    // Fetch all documents in the collection
    for (QueryDocumentSnapshot doc in query.docs) {
      String docId = doc.id;
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      establishments.add(Establishment.fromJson(docId, data));
    }
  } catch (err) {
    print(err);
  }

  return establishments;
}
