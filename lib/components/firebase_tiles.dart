import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirebaseTile extends StatelessWidget {
  final String cook;
  final String food;
  FirebaseTile({
    super.key,
    required this.food,
    required this.cook,
  });

  final TextStyle style = GoogleFonts.comicNeue();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[200],
      child: ListTile(
        tileColor: Colors.red[200],
        title: Text(
          food.toUpperCase(),
          style: style.copyWith(fontSize: 30),
        ),
        subtitle: Text(
          'Cook: $cook',
          style: style.copyWith(fontSize: 25),
        ),
      ),
    );
  }
}
