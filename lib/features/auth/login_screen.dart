import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/features/dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Header Image
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.grey,
                      image: DecorationImage(
                        image: AssetImage('assets/images/BG.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // White Arc at bottom
                  Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  // Logo Overlay
                  Positioned(
                    bottom: -35,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(30),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/LOGO.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 50),

              // Login Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: AppTextStyles.header.copyWith(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                    
                    const SizedBox(height: 24),

                    // Email Field
                    _buildLabel('Email 365'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                         isDense: true,
                         contentPadding: EdgeInsets.symmetric(vertical: 10),
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: AppColors.primary, width: 2),
                         ),
                         focusedBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: AppColors.primary, width: 2),
                         ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password Field
                    _buildLabel('Password'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                         isDense: true,
                         contentPadding: const EdgeInsets.symmetric(vertical: 10),
                           enabledBorder: const UnderlineInputBorder(
                           borderSide: BorderSide(color: AppColors.primary, width: 2),
                         ),
                         focusedBorder: const UnderlineInputBorder(
                           borderSide: BorderSide(color: AppColors.primary, width: 2),
                         ),
                         suffixIcon: IconButton(
                           icon: Icon(
                             _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                             color: Colors.black54,
                             size: 22,
                           ),
                           onPressed: () {
                             setState(() {
                               _obscurePassword = !_obscurePassword;
                             });
                           },
                         ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.pushReplacement(
                             context, 
                             MaterialPageRoute(builder: (context) => const DashboardScreen()),
                           );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'Log In',
                          style: AppTextStyles.button,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Bantuan Link
                    Center(
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              title: Text('Bantuan Login', style: AppTextStyles.title),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildHelpItem(Icons.email, 'Lupa Password?', 'Hubungi admin'),
                                  const SizedBox(height: 12),
                                  _buildHelpItem(Icons.phone, 'Telepon', '(022) 123-4567'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Tutup', style: TextStyle(color: AppColors.primary)),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Bantuan ?',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),

              // Simple Footer
              Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    '© 2024 CeLOE',
                    style: AppTextStyles.body.copyWith(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.subtitle.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 22),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
              Text(subtitle, style: AppTextStyles.subtitle.copyWith(fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
