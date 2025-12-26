import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/theme_notifier.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  late String _selectedTheme;

  @override
  void initState() {
    super.initState();
    if (themeNotifier.isDarkMode) {
      _selectedTheme = 'dark';
    } else if (themeNotifier.isSystemMode) {
      _selectedTheme = 'system';
    } else {
      _selectedTheme = 'light';
    }
  }

  void _applyTheme() {
    switch (_selectedTheme) {
      case 'dark':
        themeNotifier.setDarkMode();
        break;
      case 'system':
        themeNotifier.setSystemMode();
        break;
      default:
        themeNotifier.setLightMode();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tema ${_getThemeName(_selectedTheme)} diterapkan!')),
    );
    Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Tampilan', style: AppTextStyles.title.copyWith(
          color: isDark ? Colors.white : AppColors.textPrimary,
        )),
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : AppColors.textPrimary),
      ),
      backgroundColor: isDark ? const Color(0xFF121212) : AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Tema', style: AppTextStyles.title.copyWith(
              color: isDark ? Colors.white : AppColors.textPrimary,
            )),
            const SizedBox(height: 16),
            
            _buildThemeOption(
              title: 'Light Mode',
              subtitle: 'Tampilan terang (default)',
              icon: Icons.light_mode,
              value: 'light',
              iconColor: Colors.orange,
              isDark: isDark,
            ),
            
            _buildThemeOption(
              title: 'Dark Mode',
              subtitle: 'Tampilan gelap untuk mata',
              icon: Icons.dark_mode,
              value: 'dark',
              iconColor: Colors.indigo,
              isDark: isDark,
            ),
            
            _buildThemeOption(
              title: 'Sistem',
              subtitle: 'Mengikuti pengaturan perangkat',
              icon: Icons.settings_suggest,
              value: 'system',
              iconColor: Colors.grey,
              isDark: isDark,
            ),
            
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _applyTheme,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text('Terapkan Tema', style: AppTextStyles.button),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
    required Color iconColor,
    required bool isDark,
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
          color: isSelected 
              ? AppColors.primary.withAlpha(isDark ? 50 : 20) 
              : (isDark ? const Color(0xFF1E1E1E) : Colors.white),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : (isDark ? Colors.white24 : AppColors.grey),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconColor.withAlpha(50),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 28),
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
                      color: isSelected ? AppColors.primary : (isDark ? Colors.white : AppColors.textPrimary),
                    ),
                  ),
                  Text(
                    subtitle, 
                    style: AppTextStyles.subtitle.copyWith(
                      fontSize: 12,
                      color: isDark ? Colors.white60 : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
          ],
        ),
      ),
    );
  }
}
