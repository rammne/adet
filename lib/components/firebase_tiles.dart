import 'package:flutter/material.dart';

class FirebaseTiles extends StatelessWidget {
  final double width;
  final double height;
  const FirebaseTiles({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('test'),
        ),
      ),
    );
  }
}
