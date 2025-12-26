import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/features/dashboard/dashboard_screen.dart'; // We'll create this next

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // API/Header Section
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // 1. Header Image (Building)
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.grey, // Fallback color
                    image: DecorationImage(
                      image: AssetImage('assets/images/BG.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // 2. White Arc/Curve at bottom of image
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
                // 3. Logo Overlay
                Positioned(
                  bottom: -40,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
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
            
            const SizedBox(height: 60),

            // Login Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: AppTextStyles.header.copyWith(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                  
                  const SizedBox(height: 30),

                  // Email 365 Field
                  _buildLabel('Email 365'),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                       isDense: true,
                       contentPadding: const EdgeInsets.symmetric(vertical: 8),
                       enabledBorder: const UnderlineInputBorder(
                         borderSide: BorderSide(color: AppColors.primary, width: 2),
                       ),
                       focusedBorder: const UnderlineInputBorder(
                         borderSide: BorderSide(color: AppColors.primary, width: 2),
                       ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Password Field
                  _buildLabel('Password'),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                       isDense: true,
                       contentPadding: const EdgeInsets.symmetric(vertical: 8),
                         enabledBorder: const UnderlineInputBorder(
                         borderSide: BorderSide(color: AppColors.primary, width: 2),
                       ),
                       focusedBorder: const UnderlineInputBorder(
                         borderSide: BorderSide(color: AppColors.primary, width: 2),
                       ),
                       suffixIcon: IconButton(
                         icon: Icon(
                           _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                           color: Colors.black,
                         ),
                         onPressed: () {
                           setState(() {
                             _obscurePassword = !_obscurePassword;
                           });
                         },
                       ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                         // Navigate to Dashboard
                         Navigator.pushReplacement(
                           context, 
                           MaterialPageRoute(builder: (context) => const DashboardScreen()),
                         );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

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
                                _buildHelpItem(Icons.email, 'Lupa Password?', 'Hubungi admin kampus'),
                                const SizedBox(height: 12),
                                _buildHelpItem(Icons.phone, 'Bantuan Teknis', '(022) 123-4567'),
                                const SizedBox(height: 12),
                                _buildHelpItem(Icons.chat, 'WhatsApp', '+62 812-3456-7890'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Tutup', style: TextStyle(color: AppColors.primary)),
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

            // Bottom Wave
            SizedBox(
              height: 100,
              width: double.infinity,
              child: CustomPaint(
                painter: BottomWavePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.subtitle.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
            Text(subtitle, style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    var path = Path();
    // Start from bottom left
    path.moveTo(0, size.height);
    // Line to top left (start of wave)
    path.lineTo(0, size.height * 0.4);

    // Bezier curve for the wave
    var firstControlPoint = Offset(size.width * 0.25, -20);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 0.75, size.height * 1.0);
    var secondEndPoint = Offset(size.width, size.height * 0.6);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    
    // Line to bottom right
    path.lineTo(size.width, size.height);
    // Close path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
