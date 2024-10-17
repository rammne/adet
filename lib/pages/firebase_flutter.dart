import 'package:firebase_flutter/components/firebase_tiles.dart';
import 'package:flutter/material.dart';

class FirebaseFlutter extends StatelessWidget {
  const FirebaseFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Integration With Flutter'),
      ),
      body: Center(
        child: Container(
          height: screenH,
          width: screenW * .5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 8,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FirebaseTiles(
                  width: screenW,
                  height: screenH * .09,
                ),
                FirebaseTiles(
                  width: screenW,
                  height: screenH * .09,
                ),
                FirebaseTiles(
                  width: screenW,
                  height: screenH * .09,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
