import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter/components/firebase_tiles.dart';
import 'package:firebase_flutter/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirebaseFlutter extends StatelessWidget {
  FirebaseFlutter({super.key});

  final Firestore favFoods = Firestore();
  final TextEditingController _textEditingControllerFoodName =
      TextEditingController();
  final TextEditingController _textEditingControllerCookName =
      TextEditingController();

  final InputDecoration _inputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    void onSubmit() {
      favFoods.addFavoriteFood(
        foodName: _textEditingControllerFoodName.text,
        cookName: _textEditingControllerCookName.text,
      );
      _textEditingControllerFoodName.clear();
      _textEditingControllerCookName.clear();
      Navigator.pop(context);
    }

    void dialogBox() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Enter your favorite food.',
              style: GoogleFonts.comicNeue(fontSize: 35),
            ),
            icon: const Icon(
              Icons.food_bank,
              size: 75,
              color: Colors.black,
            ),
            backgroundColor: Colors.red[200],
            content: SizedBox(
              height: screenH * .095,
              width: screenW * .001,
              child: Column(
                children: [
                  TextField(
                    controller: _textEditingControllerCookName,
                    onSubmitted: (_) => onSubmit(),
                    decoration: _inputDecoration.copyWith(
                      hintText: 'The name of the cook...',
                      hintStyle: GoogleFonts.lato(),
                      icon: const Icon(Icons.man),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _textEditingControllerFoodName,
                    onSubmitted: (_) => onSubmit(),
                    decoration: _inputDecoration.copyWith(
                      hintText: 'The name of the food...',
                      hintStyle: GoogleFonts.lato(),
                      icon: const Icon(Icons.food_bank),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Icon(
                  Icons.send,
                ),
                onPressed: () => onSubmit(),
              ),
            ],
          );
        },
      );
    }

    final Widget floatingActionButton = FloatingActionButton(
      onPressed: () => dialogBox(),
      backgroundColor: Colors.blue[200],
      child: const Icon(Icons.add),
    );

    final Widget scaffoldContent = Center(
      child: Container(
        height: screenH,
        width: screenW * .5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade200,
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder(
            stream: favFoods.getFavoriteFoods(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No favorite food listed yet'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  String food = document['food_name'];
                  String cook = document['cook_name'];

                  return FirebaseTile(food: food, cook: cook);
                },
              );
            },
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Integration With Flutter'),
      ),
      body: scaffoldContent,
      floatingActionButton: floatingActionButton,
    );
  }
}
