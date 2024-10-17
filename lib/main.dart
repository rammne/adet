import 'package:firebase_flutter/components/firebase_tiles.dart';
import 'package:firebase_flutter/pages/firebase_flutter.dart';
import 'package:firebase_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[200],
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.blue[200],
          elevation: 6,
          titleTextStyle: GoogleFonts.comingSoon(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: FirebaseFlutter(),
    );
  }
}
