import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const Hearts2HeartsApp());
}

class Hearts2HeartsApp extends StatelessWidget {
  const Hearts2HeartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeartSync - Hearts2Hearts',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Segoe UI',
        fontFamilyFallback: const ['Segoe UI', 'Arial', 'sans-serif'],
        textTheme: const TextTheme().apply(
          fontFamily: 'Segoe UI',
          fontFamilyFallback: const ['Segoe UI', 'Arial', 'sans-serif'],
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.cardSurface,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
