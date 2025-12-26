import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined, size: 60, color: AppColors.grey),
          const SizedBox(height: 16),
          Text(
            'Tidak ada notifikasi baru',
            style: AppTextStyles.subtitle,
          ),
        ],
      ),
    );
  }
}
