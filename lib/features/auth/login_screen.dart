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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header Section
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Header Image
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.grey,
                            image: DecorationImage(
                              image: AssetImage('assets/images/BG.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Curve
                        Positioned(
                          bottom: -1,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                            ),
                          ),
                        ),
                        // Logo Overlay
                        Positioned(
                          bottom: -40,
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(20),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/LOGO.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.school, size: 40, color: AppColors.primary);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 60),

                    // Login Form
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: AppTextStyles.header.copyWith(
                              color: AppColors.primary,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Silakan masuk dengan akun Anda',
                            style: AppTextStyles.subtitle,
                          ),
                          
                          const SizedBox(height: 40),

                          // Email Field
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                               labelText: 'Email',
                               hintText: 'user@student.university.ac.id',
                               prefixIcon: const Icon(Icons.email_outlined),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(12),
                               ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Password Field
                          TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                               labelText: 'Password',
                               prefixIcon: const Icon(Icons.lock_outline),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(12),
                               ),
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
                            height: 52,
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
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: AppTextStyles.button.copyWith(fontSize: 16),
                              ),
                              child: const Text('Masuk'),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Bantuan Link
                          TextButton.icon(
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
                                      _buildHelpItem(Icons.lock_reset, 'Lupa Password?', 'Hubungi admin di BAAK'),
                                      const SizedBox(height: 16),
                                      _buildHelpItem(Icons.support_agent, 'Helpdesk', '(022) 756-4321'),
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
                            icon: const Icon(Icons.help_outline, size: 18, color: AppColors.textSecondary),
                            label: Text(
                              'Butuh Bantuan?',
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Simple Footer
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        '© 2024 CeLOE',
                        style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
              Text(subtitle, style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
