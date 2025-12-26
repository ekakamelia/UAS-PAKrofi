import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';

class SettingsNotificationScreen extends StatefulWidget {
  const SettingsNotificationScreen({super.key});

  @override
  State<SettingsNotificationScreen> createState() => _SettingsNotificationScreenState();
}

class _SettingsNotificationScreenState extends State<SettingsNotificationScreen> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _assignmentNotif = true;
  bool _announcementNotif = true;
  bool _gradeNotif = true;
  bool _forumNotif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Notifikasi', style: AppTextStyles.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Metode Notifikasi', style: AppTextStyles.title),
            const SizedBox(height: 12),
            _buildSwitchTile(
              title: 'Push Notification',
              subtitle: 'Terima notifikasi langsung di perangkat',
              value: _pushEnabled,
              onChanged: (val) => setState(() => _pushEnabled = val),
            ),
            _buildSwitchTile(
              title: 'Email Notification',
              subtitle: 'Terima notifikasi melalui email',
              value: _emailEnabled,
              onChanged: (val) => setState(() => _emailEnabled = val),
            ),

            const SizedBox(height: 24),
            Text('Jenis Notifikasi', style: AppTextStyles.title),
            const SizedBox(height: 12),
            _buildSwitchTile(
              title: 'Tugas Baru',
              subtitle: 'Notifikasi saat ada tugas baru',
              value: _assignmentNotif,
              onChanged: (val) => setState(() => _assignmentNotif = val),
            ),
            _buildSwitchTile(
              title: 'Pengumuman',
              subtitle: 'Notifikasi pengumuman penting',
              value: _announcementNotif,
              onChanged: (val) => setState(() => _announcementNotif = val),
            ),
            _buildSwitchTile(
              title: 'Nilai Keluar',
              subtitle: 'Notifikasi saat nilai dipublikasikan',
              value: _gradeNotif,
              onChanged: (val) => setState(() => _gradeNotif = val),
            ),
            _buildSwitchTile(
              title: 'Forum Diskusi',
              subtitle: 'Notifikasi balasan di forum',
              value: _forumNotif,
              onChanged: (val) => setState(() => _forumNotif = val),
            ),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pengaturan berhasil disimpan')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Simpan', style: AppTextStyles.button),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
                Text(subtitle, style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
