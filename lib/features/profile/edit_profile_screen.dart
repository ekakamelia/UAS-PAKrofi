import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _dosenWaliController;
  late TextEditingController _tahunMasukController;
  
  int _selectedAvatarIndex = 0;
  
  final List<Color> _avatarColors = [
    AppColors.primary,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: DummyData.currentUser.name);
    _emailController = TextEditingController(text: 'dandy.candra@student.university.ac.id');
    _nimController = TextEditingController(text: '1234567890');
    _prodiController = TextEditingController(text: 'Teknik Informatika');
    _dosenWaliController = TextEditingController(text: 'Dr. Ahmad Yusuf, M.Kom');
    _tahunMasukController = TextEditingController(text: '2022');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _dosenWaliController.dispose();
    _tahunMasukController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil berhasil disimpan!'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil', style: AppTextStyles.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: Text(
              'Simpan',
              style: AppTextStyles.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Photo Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        backgroundImage: const AssetImage('assets/images/foto profil.jpeg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => _showAvatarColorPicker(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Ketuk untuk ubah foto',
                    style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Form Fields
            Text('Informasi Pribadi', style: AppTextStyles.title),
            const SizedBox(height: 16),
            
            _buildTextField(
              label: 'Nama Lengkap',
              controller: _nameController,
              icon: Icons.person_outline,
            ),
            
            _buildTextField(
              label: 'Email',
              controller: _emailController,
              icon: Icons.email_outlined,
              enabled: false,
            ),
            
            _buildTextField(
              label: 'NIM',
              controller: _nimController,
              icon: Icons.badge_outlined,
              enabled: false,
            ),
            
            const SizedBox(height: 24),
            Text('Informasi Akademik', style: AppTextStyles.title),
            const SizedBox(height: 16),
            
            _buildTextField(
              label: 'Program Studi',
              controller: _prodiController,
              icon: Icons.school_outlined,
              enabled: false,
            ),
            
            _buildTextField(
              label: 'Tahun Masuk',
              controller: _tahunMasukController,
              icon: Icons.calendar_today_outlined,
              enabled: false,
            ),
            
            _buildTextField(
              label: 'Dosen Wali',
              controller: _dosenWaliController,
              icon: Icons.person_pin_outlined,
              enabled: false,
            ),
            
            const SizedBox(height: 32),
            
            // Save Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Simpan Perubahan',
                  style: AppTextStyles.button.copyWith(fontSize: 16),
                ),
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool enabled = true,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: enabled ? Colors.white : AppColors.grey.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey.withAlpha(100)),
            ),
            child: TextField(
              controller: controller,
              enabled: enabled,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                prefixIcon: Icon(icon, color: AppColors.primary, size: 22),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                suffixIcon: enabled
                    ? const Icon(Icons.edit, color: AppColors.textSecondary, size: 18)
                    : const Icon(Icons.lock_outline, color: AppColors.textSecondary, size: 18),
              ),
              style: AppTextStyles.body.copyWith(
                color: enabled ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAvatarColorPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Warna Avatar', style: AppTextStyles.title),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(_avatarColors.length, (index) {
                final isSelected = _selectedAvatarIndex == index;
                return InkWell(
                  onTap: () {
                    setState(() => _selectedAvatarIndex = index);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _avatarColors[index],
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: Colors.black, width: 3)
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 28)
                        : null,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
