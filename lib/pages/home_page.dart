import 'package:firebase_flutter/components/tiles.dart';
import 'package:firebase_flutter/pages/firebase_flutter.dart';
import 'package:firebase_flutter/pages/gemini_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cool Website'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTiles(
              text: 'Flutter Firebase',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirebaseFlutter(),
                ),
              ),
            ),
            MyTiles(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GeminiFlutter(),
                ),
              ),
              text: 'Flutter Gemini API',
            ),
          ],
        ),
      ),
    );
  }
}
