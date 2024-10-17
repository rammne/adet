import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTiles extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MyTiles({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade900,
            blurRadius: 15,
            offset: Offset(
              15,
              15,
            ),
          ),
        ],
      ),
      child: Material(
        color: Colors.blue[500],
        borderRadius: BorderRadius.circular(5),
        shadowColor: Colors.blue,
        elevation: 10,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.zcoolKuaiLe(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
