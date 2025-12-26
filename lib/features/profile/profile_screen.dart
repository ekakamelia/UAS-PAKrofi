import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';
import 'package:celeoe/features/auth/login_screen.dart';
import 'package:celeoe/features/gradebook/gradebook_screen.dart';
import 'package:celeoe/features/forum/forum_screen.dart';
import 'package:celeoe/features/cbt/cbt_screen.dart';
import 'package:celeoe/features/calendar/calendar_screen.dart';
import 'package:celeoe/features/settings/settings_notification_screen.dart';
import 'package:celeoe/features/settings/change_password_screen.dart';
import 'package:celeoe/features/settings/language_screen.dart';
import 'package:celeoe/features/settings/help_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text(
                    DummyData.currentUser.name[0],
                    style: AppTextStyles.header.copyWith(
                      fontSize: 40,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  DummyData.currentUser.name,
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DummyData.currentUser.role,
                  style: AppTextStyles.subtitle.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'NIM: 1234567890',
                    style: AppTextStyles.body.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Info Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Akun',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 12),
                _buildInfoTile(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  value: 'dandy.candra@student.university.ac.id',
                ),
                _buildInfoTile(
                  icon: Icons.school_outlined,
                  title: 'Program Studi',
                  value: 'Teknik Informatika',
                ),
                _buildInfoTile(
                  icon: Icons.calendar_today_outlined,
                  title: 'Tahun Masuk',
                  value: '2022',
                ),
                _buildInfoTile(
                  icon: Icons.person_outline,
                  title: 'Dosen Wali',
                  value: 'Dr. Ahmad Yusuf, M.Kom',
                ),

                const SizedBox(height: 24),

                Text(
                  'Akademik',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 12),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.grade_outlined,
                  title: 'Nilai & IPK',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GradebookScreen()),
                    );
                  },
                ),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.forum_outlined,
                  title: 'Forum Diskusi',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForumScreen()),
                    );
                  },
                ),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.quiz_outlined,
                  title: 'Kuis & Ujian (CBT)',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CBTScreen()),
                    );
                  },
                ),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.calendar_month_outlined,
                  title: 'Kalender Akademik',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CalendarScreen()),
                    );
                  },
                ),

                const SizedBox(height: 24),

                Text(
                  'Pengaturan',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 12),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.notifications_outlined,
                  title: 'Pengaturan Notifikasi',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsNotificationScreen()),
                    );
                  },
                ),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.lock_outline,
                  title: 'Ubah Password',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                    );
                  },
                ),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.language_outlined,
                  title: 'Bahasa',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LanguageScreen()),
                    );
                  },
                ),
                _buildSettingsTileWithContext(
                  context: context,
                  icon: Icons.help_outline,
                  title: 'Bantuan',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HelpScreen()),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Logout Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: Text(
                      'Keluar',
                      style: AppTextStyles.button.copyWith(color: Colors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.subtitle.copyWith(fontSize: 12),
              ),
              Text(
                value,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.body,
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTileWithContext({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
