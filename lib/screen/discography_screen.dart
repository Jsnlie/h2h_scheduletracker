import 'package:flutter/material.dart';

class DiscographyScreen extends StatelessWidget {
  const DiscographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discography',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: const Center(child: Text('Discography Screen - Coming Soon')),
    );
  }
}
