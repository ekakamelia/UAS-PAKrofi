import 'dart:async';
import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class CBTQuizScreen extends StatefulWidget {
  final Quiz quiz;

  const CBTQuizScreen({super.key, required this.quiz});

  @override
  State<CBTQuizScreen> createState() => _CBTQuizScreenState();
}

class _CBTQuizScreenState extends State<CBTQuizScreen> {
  int _currentQuestionIndex = 0;
  Map<int, int> _answers = {};
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.quiz.durationMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _submitQuiz();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _selectAnswer(int optionIndex) {
    setState(() {
      _answers[_currentQuestionIndex] = optionIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _prevQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _submitQuiz() {
    _timer?.cancel();

    int correctCount = 0;
    for (int i = 0; i < widget.quiz.questions.length; i++) {
      if (_answers[i] == widget.quiz.questions[i].correctIndex) {
        correctCount++;
      }
    }

    final score = (correctCount / widget.quiz.questions.length * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Hasil Kuis', style: AppTextStyles.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: score >= 70 ? Colors.green : Colors.orange,
              child: Text(
                '$score',
                style: AppTextStyles.header.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              score >= 70 ? 'Selamat! Anda Lulus' : 'Perlu Belajar Lagi',
              style: AppTextStyles.title.copyWith(
                color: score >= 70 ? Colors.green : Colors.orange,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Benar: $correctCount dari ${widget.quiz.questions.length} soal',
              style: AppTextStyles.subtitle,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to CBT list
            },
            child: Text('Selesai', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title, style: AppTextStyles.title.copyWith(fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _remainingSeconds < 60 ? Colors.red : AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Text(
                  _formatTime(_remainingSeconds),
                  style: AppTextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Progress Bar
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / widget.quiz.questions.length,
            backgroundColor: AppColors.grey,
            color: AppColors.primary,
            minHeight: 6,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question Number
                  Text(
                    'Soal ${_currentQuestionIndex + 1} dari ${widget.quiz.questions.length}',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 16),

                  // Question Text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
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
                    child: Text(
                      question.question,
                      style: AppTextStyles.title.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Options
                  ...List.generate(question.options.length, (index) {
                    final isSelected = _answers[_currentQuestionIndex] == index;
                    return InkWell(
                      onTap: () => _selectAnswer(index),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : AppColors.grey,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + index), // A, B, C, D
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? AppColors.primary : AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                question.options[index],
                                style: AppTextStyles.body.copyWith(
                                  color: isSelected ? Colors.white : AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Navigation Buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                if (_currentQuestionIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _prevQuestion,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Sebelumnya'),
                    ),
                  ),
                if (_currentQuestionIndex > 0) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _currentQuestionIndex < widget.quiz.questions.length - 1
                        ? _nextQuestion
                        : _submitQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      _currentQuestionIndex < widget.quiz.questions.length - 1
                          ? 'Selanjutnya'
                          : 'Selesai',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
