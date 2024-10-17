import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/components/firebase_tiles.dart';
import 'package:firebase_flutter/firebase_options.dart';
import 'package:firebase_flutter/pages/firebase_flutter.dart';
import 'package:firebase_flutter/pages/gemini_flutter.dart';
import 'package:firebase_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red[200],
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.blue[200],
          elevation: 2,
          titleTextStyle: GoogleFonts.comingSoon(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              Colors.black,
            ),
            backgroundColor: WidgetStatePropertyAll(Colors.blue[200]),
          ),
        ),
      ),
      home: GeminiFlutter(),
    );
  }
}
