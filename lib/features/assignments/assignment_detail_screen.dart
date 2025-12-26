import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class AssignmentDetailScreen extends StatefulWidget {
  final Assignment assignment;

  const AssignmentDetailScreen({super.key, required this.assignment});

  @override
  State<AssignmentDetailScreen> createState() => _AssignmentDetailScreenState();
}

class _AssignmentDetailScreenState extends State<AssignmentDetailScreen> {
  bool _isFileUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Tugas',
          style: AppTextStyles.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course & Title
              Text(
                widget.assignment.courseName,
                style: AppTextStyles.subtitle.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              Text(
                widget.assignment.title,
                style: AppTextStyles.header.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 16),
              
              // Deadline Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(25),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.red),
                    const SizedBox(width: 8),
                    Text(
                      'Batas Waktu: ${widget.assignment.deadline.day}/${widget.assignment.deadline.month}/${widget.assignment.deadline.year} 23:59',
                      style: AppTextStyles.body.copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),

              // Description
              Text(
                'Deskripsi Tugas',
                style: AppTextStyles.title,
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.assignment.description,
                  style: AppTextStyles.body.copyWith(height: 1.5),
                ),
              ),

              const SizedBox(height: 32),

              // Submission Section
              Text(
                'Pengumpulan',
                style: AppTextStyles.title,
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Column(
                  children: [
                    if (_isFileUploaded) ...[
                      const Icon(Icons.check_circle, color: AppColors.green, size: 50),
                      const SizedBox(height: 12),
                      Text(
                        'File berhasil diunggah: tugas_dandy.pdf',
                        style: AppTextStyles.body.copyWith(color: AppColors.green),
                      ),
                      const SizedBox(height: 20),
                    ] else ...[
                      const Icon(Icons.cloud_upload_outlined, size: 50, color: AppColors.textSecondary),
                      const SizedBox(height: 12),
                      Text(
                        'Unggah file tugas Anda di sini (PDF, DOCX, ZIP)',
                        style: AppTextStyles.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _isFileUploaded = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('File berhasil diunggah')),
                          );
                        },
                        icon: const Icon(Icons.attach_file),
                        label: const Text('Pilih File'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isFileUploaded ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tugas berhasil dikumpulkan!')),
                    );
                    Navigator.pop(context);
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppColors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Kirim Tugas',
                    style: AppTextStyles.button,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
