import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final CollectionReference favFoodsRef =
      FirebaseFirestore.instance.collection('favorite foods');

  // Create new document
  // Future<void> addFavoriteFood(
  //     {required String foodName, required String cookName}) {
  //   return favFoodsRef.doc(foodName.toLowerCase()).set({
  //     'food_name': foodName,
  //     'cook_name': cookName,
  //   });
  // }
  Future<void> addFavoriteFood(
      // adding using add() function
      {required String foodName,
      required String cookName}) {
    return favFoodsRef.add({
      'food_name': foodName,
      'cook_name': cookName,
    });
  }

  // Read all documents
  Stream<QuerySnapshot> getFavoriteFoods() {
    return favFoodsRef.snapshots();
  }

  // Update a document
  Future<void> updateFavoriteFood(
      {required String foodName, required Map<String, dynamic> updatedData}) {
    return favFoodsRef.doc(foodName.toLowerCase()).update(updatedData);
  }

  // Delete a document
  Future<void> deleteFavoriteFood({required String foodName}) {
    return favFoodsRef.doc(foodName).delete();
  }
}
