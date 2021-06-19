import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject_app/models/Location.dart';

class DatabaseService {


  DatabaseService();

  // collection reference
  final CollectionReference LocationsCollection = Firestore.instance.collection('locations');

  Future<void> setUserData(Location location) async {
    return await LocationsCollection.document(location.name).setData({
      'name': location.name,
      'theme': location.theme,
      'description': location.description,
      'imageUrl': location.imageUrl,
      'locationUrl': location.locationUrl

    });
  }

  Future<void> updateUserData(Location location) async {
    return await LocationsCollection.document(location.name).updateData({
      'name': location.name,
      'theme': location.theme,
      'description': location.description,
      'imageUrl': location.imageUrl,
      'locationUrl': location.locationUrl

    });
  }
  List<Location> locationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Location(
          name: doc.data['name'] ?? '',
          description: doc.data['description'] ?? '',
          theme: doc.data['theme'] ?? '',
          imageUrl: doc.data['imageUrl'] ?? '',
          locationUrl: doc.data['locationUrl'] ?? ''
      );
    }).toList();
  }
  Stream<List<Location>> get locations {
    return LocationsCollection.snapshots()
     .map(locationListFromSnapshot);
  }

}