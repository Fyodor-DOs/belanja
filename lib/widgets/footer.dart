import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 50,
      child: const Center(
        child: Text(
          'Ahmed Fathir Syafaat 2241720083',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
