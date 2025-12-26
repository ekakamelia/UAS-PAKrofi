import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';
import 'package:celeoe/features/dashboard/widgets/upcoming_card.dart';
import 'package:celeoe/features/dashboard/widgets/announcement_banner.dart';
import 'package:celeoe/features/dashboard/widgets/course_progress_item.dart';
import 'package:celeoe/features/classes/my_classes_screen.dart';
import 'package:celeoe/features/notifications/notifications_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DashboardContent(),
      const MyClassesScreen(),
      const NotificationsScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _selectedIndex != 0 
          ? AppBar(
              title: Text(
                _selectedIndex == 1 ? 'Kelas Saya' : 'Notifikasi',
                style: AppTextStyles.title,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: AppColors.textPrimary),
            )
          : null,
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.class_outlined),
             label: 'Kelas Saya',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Profile
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    DummyData.currentUser.name[0],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DummyData.currentUser.name,
                      style: AppTextStyles.title,
                    ),
                    Text(
                      DummyData.currentUser.role,
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                  color: AppColors.textPrimary,
                )
              ],
            ),

            const SizedBox(height: 24),

            // 2. Upcoming Assignments
            UpcomingAssignmentCard(assignment: DummyData.upcomingAssignments[0]),

            const SizedBox(height: 20),

            // 3. Announcements
            if (DummyData.announcements.isNotEmpty)
              AnnouncementBanner(announcement: DummyData.announcements[0]),
            
            const SizedBox(height: 24),

            // 4. Course Progress
            Text(
              'Progres Kelas',
              style: AppTextStyles.title.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2))
                ]
              ),
              child: Column(
                children: DummyData.courses.map((course) => 
                  CourseProgressItem(course: course)
                ).toList(),
              ),
            ),
            // Add some extra space for scrolling
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
