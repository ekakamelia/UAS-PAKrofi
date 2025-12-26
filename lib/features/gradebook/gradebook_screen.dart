import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class GradebookScreen extends StatelessWidget {
  const GradebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipk = GradeData.calculateIPK();
    final totalSKS = GradeData.totalSKS;
    final semesters = GradeData.semesters;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai & IPK', style: AppTextStyles.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // IPK Summary Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(100),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('IPK', ipk.toStringAsFixed(2), Icons.school),
                  Container(width: 1, height: 60, color: Colors.white24),
                  _buildStatItem('Total SKS', totalSKS.toString(), Icons.book),
                  Container(width: 1, height: 60, color: Colors.white24),
                  _buildStatItem('Semester', semesters.length.toString(), Icons.calendar_today),
                ],
              ),
            ),

            // Grades by Semester
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: semesters.map((semester) {
                  final semesterGrades = GradeData.getGradesBySemester(semester);
                  return _buildSemesterSection(semester, semesterGrades);
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.header.copyWith(color: Colors.white, fontSize: 24),
        ),
        Text(
          label,
          style: AppTextStyles.subtitle.copyWith(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildSemesterSection(String semester, List<Grade> grades) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Semester Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              semester,
              style: AppTextStyles.title.copyWith(color: Colors.white),
            ),
          ),
          // Grades List
          ...grades.map((grade) => _buildGradeItem(grade)),
        ],
      ),
    );
  }

  Widget _buildGradeItem(Grade grade) {
    Color gradeColor = _getGradeColor(grade.grade);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.grey.withAlpha(100)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grade.courseName,
                  style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  '${grade.sks} SKS',
                  style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: gradeColor.withAlpha(30),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                grade.grade,
                style: AppTextStyles.title.copyWith(color: gradeColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B+':
      case 'B':
        return Colors.blue;
      case 'C+':
      case 'C':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}
