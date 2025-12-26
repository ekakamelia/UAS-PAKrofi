import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/features/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login Screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simulating the logo with Text for now. 
            // In a real app, this would be Image.asset('assets/logo.png')
            Text(
              'CeLOE',
              style: AppTextStyles.logoText.copyWith(
                fontSize: 60,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Learning Management System',
              style: AppTextStyles.body.copyWith(
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
