import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'id';

  final List<Map<String, String>> _languages = [
    {'code': 'id', 'name': 'Bahasa Indonesia', 'flag': '🇮🇩'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'ar', 'name': 'العربية', 'flag': '🇸🇦'},
    {'code': 'zh', 'name': '中文', 'flag': '🇨🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Bahasa', style: AppTextStyles.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      backgroundColor: AppColors.background,
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final lang = _languages[index];
          final isSelected = lang['code'] == _selectedLanguage;
          
          return InkWell(
            onTap: () {
              setState(() {
                _selectedLanguage = lang['code']!;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Bahasa diubah ke ${lang['name']}')),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary.withAlpha(25) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: isSelected 
                    ? Border.all(color: AppColors.primary, width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  Text(lang['flag']!, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      lang['name']!,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (isSelected)
                    const Icon(Icons.check_circle, color: AppColors.primary),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
