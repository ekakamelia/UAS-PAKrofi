import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class CourseProgressItem extends StatelessWidget {
  final Course course;

  const CourseProgressItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          // Course Icon placeholder
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.book, color: AppColors.textSecondary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: course.progress,
                  backgroundColor: AppColors.grey,
                  color: AppColors.green, // Use green as per common UI patterns for progress
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(course.progress * 100).toInt()}% Selesai',
                  style: AppTextStyles.subtitle.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
