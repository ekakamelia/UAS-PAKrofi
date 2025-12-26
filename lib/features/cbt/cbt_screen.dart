import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';
import 'package:celeoe/features/cbt/cbt_quiz_screen.dart';

class CBTScreen extends StatelessWidget {
  const CBTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Based Test', style: AppTextStyles.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      backgroundColor: AppColors.background,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: QuizData.quizzes.length,
        itemBuilder: (context, index) {
          final quiz = QuizData.quizzes[index];
          return _buildQuizCard(context, quiz);
        },
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, Quiz quiz) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.quiz_outlined, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quiz.title,
                        style: AppTextStyles.title.copyWith(color: Colors.white),
                      ),
                      Text(
                        quiz.courseName,
                        style: AppTextStyles.subtitle.copyWith(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildDetailItem(Icons.timer_outlined, '${quiz.durationMinutes} menit'),
                    const SizedBox(width: 24),
                    _buildDetailItem(Icons.help_outline, '${quiz.questions.length} soal'),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CBTQuizScreen(quiz: quiz),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Mulai Kuis', style: AppTextStyles.button),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(text, style: AppTextStyles.subtitle),
      ],
    );
  }
}
