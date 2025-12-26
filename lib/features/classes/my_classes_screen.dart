import 'package:flutter/material.dart';

import 'package:celeoe/core/dummy_data.dart';
import 'package:celeoe/features/dashboard/widgets/course_progress_item.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: DummyData.courses.length,
      itemBuilder: (context, index) {
        return CourseProgressItem(course: DummyData.courses[index]);
      },
    );
  }
}
