import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';
import 'package:celeoe/features/assignments/assignment_detail_screen.dart';

class UpcomingAssignmentCard extends StatelessWidget {
  final Assignment assignment;

  const UpcomingAssignmentCard({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentDetailScreen(assignment: assignment),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: const Border(
            left: BorderSide(color: AppColors.primary, width: 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tugas Yang Akan Datang',
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const Icon(Icons.calendar_today, size: 16, color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              assignment.title,
              style: AppTextStyles.title.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              assignment.courseName,
              style: AppTextStyles.subtitle.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(25),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Batas Waktu: ${assignment.deadline.day}/${assignment.deadline.month}/${assignment.deadline.year}',
                style: AppTextStyles.body.copyWith(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
