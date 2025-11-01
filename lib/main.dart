import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(const Hearts2HeartsApp());
}

class Hearts2HeartsApp extends StatelessWidget {
  const Hearts2HeartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hearts2Hearts',
      theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Sans'),
      home: const SplashScreen(),
    );
  }
}
