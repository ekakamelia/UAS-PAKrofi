import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  String _selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tampilan', style: AppTextStyles.title),
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
            Text('Pilih Tema', style: AppTextStyles.title),
            const SizedBox(height: 16),
            
            _buildThemeOption(
              title: 'Light Mode',
              subtitle: 'Tampilan terang (default)',
              icon: Icons.light_mode,
              value: 'light',
              colors: [Colors.white, AppColors.background],
            ),
            
            _buildThemeOption(
              title: 'Dark Mode',
              subtitle: 'Tampilan gelap untuk mata',
              icon: Icons.dark_mode,
              value: 'dark',
              colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
            ),
            
            _buildThemeOption(
              title: 'Sistem',
              subtitle: 'Mengikuti pengaturan perangkat',
              icon: Icons.settings_suggest,
              value: 'system',
              colors: [Colors.grey.shade300, Colors.grey.shade600],
            ),
            
            const SizedBox(height: 32),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withAlpha(100)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Fitur Dark Mode akan tersedia dalam update berikutnya. Saat ini menggunakan Light Mode.',
                      style: AppTextStyles.body.copyWith(color: Colors.blue, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tema ${_getThemeName(_selectedTheme)} dipilih')),
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

  String _getThemeName(String value) {
    switch (value) {
      case 'dark':
        return 'Dark Mode';
      case 'system':
        return 'Sistem';
      default:
        return 'Light Mode';
    }
  }

  Widget _buildThemeOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
    required List<Color> colors,
  }) {
    final isSelected = _selectedTheme == value;
    
    return InkWell(
      onTap: () {
        setState(() => _selectedTheme = value);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withAlpha(15) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grey.withAlpha(100),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Icon(icon, color: value == 'dark' ? Colors.white : Colors.grey.shade700),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                  Text(subtitle, style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: AppColors.primary, size: 24),
          ],
        ),
      ),
    );
  }
}
