import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan', style: AppTextStyles.title),
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
            // Contact Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.support_agent, color: Colors.white, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'Butuh Bantuan?',
                    style: AppTextStyles.title.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tim support kami siap membantu 24/7',
                    style: AppTextStyles.subtitle.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text('Hubungi Kami', style: AppTextStyles.title),
            const SizedBox(height: 12),
            _buildContactTile(
              context,
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'support@celoe.ac.id',
            ),
            _buildContactTile(
              context,
              icon: Icons.phone_outlined,
              title: 'Telepon',
              value: '(022) 123-4567',
            ),
            _buildContactTile(
              context,
              icon: Icons.chat_outlined,
              title: 'WhatsApp',
              value: '+62 812-3456-7890',
            ),

            const SizedBox(height: 24),
            Text('FAQ', style: AppTextStyles.title),
            const SizedBox(height: 12),
            _buildFaqItem(
              'Bagaimana cara mengumpulkan tugas?',
              'Buka halaman Kelas Saya > pilih mata kuliah > klik tugas > unggah file dan klik Kirim.',
            ),
            _buildFaqItem(
              'Bagaimana cara melihat nilai?',
              'Buka halaman Profil > pilih menu Nilai & IPK untuk melihat semua nilai Anda.',
            ),
            _buildFaqItem(
              'Apa yang harus dilakukan jika lupa password?',
              'Klik tombol "Bantuan" di halaman login atau hubungi admin kampus.',
            ),
            _buildFaqItem(
              'Bagaimana cara mengikuti kuis online?',
              'Buka halaman Profil > pilih menu Kuis & Ujian (CBT) > pilih kuis yang tersedia.',
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile(BuildContext context, {
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
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
              Text(value, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(question, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
        childrenPadding: const EdgeInsets.all(16),
        children: [
          Text(answer, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
