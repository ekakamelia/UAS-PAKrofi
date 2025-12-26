import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/features/auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLOE LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Poppins', 
        // Note: GoogleFonts usually applies globally via textTheme, 
        // but this is a fallback if we manually specify fontFamily in pubspec.
        // We will rely on AppTextStyles mostly.
      ),
      home: const SplashScreen(),
    );
  }
}
