import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class CourseDetailScreen extends StatelessWidget {
  final CourseDetail course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar with Course Info
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: AppColors.primary,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(20),
              centerTitle: false,
              title: Text(
                course.title,
                style: AppTextStyles.title.copyWith(
                  color: Colors.white, 
                  fontSize: 18, // Slightly bigger
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(offset: const Offset(0, 1), blurRadius: 4, color: Colors.black.withAlpha(50))
                  ]
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    top: -30,
                    child: Icon(
                      Icons.class_outlined,
                      size: 200,
                      color: Colors.white.withAlpha(15),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Instructor Info (New Position)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary.withAlpha(20),
                    child: const Icon(Icons.person, color: AppColors.primary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dosen Pengampu',
                        style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                      ),
                      Text(
                        course.instructor,
                        style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Progress Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(5),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress Kelas',
                        style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                         '${(course.progress * 100).toInt()}%',
                         style: AppTextStyles.title.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: course.progress,
                      backgroundColor: AppColors.grey.withAlpha(50),
                      color: AppColors.primary,
                      minHeight: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Description
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: AppTextStyles.title.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    course.description,
                    style: AppTextStyles.body.copyWith(
                      height: 1.6, // Better line height for readability
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                           color: AppColors.primary.withAlpha(20),
                           borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Icon(Icons.folder_open, color: AppColors.primary, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Materi Pembelajaran',
                        style: AppTextStyles.title.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Materials List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final material = course.materials[index];
                  return _buildMaterialItem(context, material, index);
                },
                childCount: course.materials.length,
              ),
            ),
          ),

          // Bottom Padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialItem(BuildContext context, CourseMaterial material, int index) {
    IconData icon;
    Color iconColor;
    Color bgColor;

    switch (material.type) {
      case 'video':
        icon = Icons.play_arrow_rounded; // Cleaner icon
        iconColor = const Color(0xFFFF5252);
        bgColor = const Color(0xFFFFEBEE);
        break;
      case 'pdf':
        icon = Icons.article_rounded;
        iconColor = const Color(0xFFFF9800);
        bgColor = const Color(0xFFFFF3E0);
        break;
      default:
        icon = Icons.link_rounded;
        iconColor = const Color(0xFF2196F3);
        bgColor = const Color(0xFFE3F2FD);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Reduced margin slightly
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100), // Subtle border
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Membuka: ${material.title}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      material.title,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      material.description,
                      style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}
