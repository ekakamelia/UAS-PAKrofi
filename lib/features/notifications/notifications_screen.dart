import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';
import 'package:celeoe/features/assignments/assignment_detail_screen.dart';
import 'package:celeoe/features/gradebook/gradebook_screen.dart';
import 'package:celeoe/features/forum/forum_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<AppNotification> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = List.from(NotificationData.notifications);
  }

  void _handleNotificationTap(AppNotification notification, int index) {
    setState(() {
      _notifications[index] = AppNotification(
        id: notification.id,
        title: notification.title,
        message: notification.message,
        type: notification.type,
        createdAt: notification.createdAt,
        isRead: true,
      );
    });

    switch (notification.type) {
      case 'assignment':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentDetailScreen(
              assignment: DummyData.upcomingAssignments[0],
            ),
          ),
        );
        break;
      case 'grade':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GradebookScreen()),
        );
        break;
      case 'forum':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForumScreen()),
        );
        break;
      case 'announcement':
        _showAnnouncementDialog(notification);
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(notification.message)),
        );
    }
  }

  void _showAnnouncementDialog(AppNotification notification) {
    final isDark = AppColors.isDark(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.getCardColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.campaign, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(notification.title, style: AppTextStyles.title.copyWith(
              color: AppColors.getTextPrimary(context),
            )),
          ],
        ),
        content: Text(notification.message, style: AppTextStyles.body.copyWith(
          color: AppColors.getTextPrimary(context),
        )),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications.map((n) => AppNotification(
        id: n.id,
        title: n.title,
        message: n.message,
        type: n.type,
        createdAt: n.createdAt,
        isRead: true,
      )).toList();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Semua notifikasi ditandai sudah dibaca')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_off_outlined, size: 60, color: AppColors.getTextSecondary(context)),
            const SizedBox(height: 16),
            Text(
              'Tidak ada notifikasi baru',
              style: AppTextStyles.subtitle.copyWith(color: AppColors.getTextSecondary(context)),
            ),
          ],
        ),
      );
    }

    final hasUnread = _notifications.any((n) => !n.isRead);

    return Column(
      children: [
        if (hasUnread)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: _markAllAsRead,
                  icon: const Icon(Icons.done_all, size: 18),
                  label: const Text('Tandai semua dibaca'),
                  style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                ),
              ],
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              return _buildNotificationItem(notification, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationItem(AppNotification notification, int index) {
    final isDark = AppColors.isDark(context);
    IconData icon;
    Color iconColor;

    switch (notification.type) {
      case 'assignment':
        icon = Icons.assignment;
        iconColor = Colors.blue;
        break;
      case 'announcement':
        icon = Icons.campaign;
        iconColor = AppColors.primary;
        break;
      case 'grade':
        icon = Icons.grade;
        iconColor = Colors.green;
        break;
      case 'forum':
        icon = Icons.forum;
        iconColor = Colors.purple;
        break;
      default:
        icon = Icons.notifications;
        iconColor = AppColors.textSecondary;
    }

    return InkWell(
      onTap: () => _handleNotificationTap(notification, index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notification.isRead 
              ? AppColors.getCardColor(context) 
              : AppColors.primary.withAlpha(isDark ? 30 : 10),
          borderRadius: BorderRadius.circular(12),
          border: notification.isRead 
              ? null 
              : Border.all(color: AppColors.primary.withAlpha(50)),
          boxShadow: isDark ? null : [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconColor.withAlpha(30),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: AppTextStyles.body.copyWith(
                            fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.bold,
                            color: AppColors.getTextPrimary(context),
                          ),
                        ),
                      ),
                      if (!notification.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.message,
                    style: AppTextStyles.subtitle.copyWith(
                      fontSize: 13,
                      color: AppColors.getTextSecondary(context),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        _formatTime(notification.createdAt),
                        style: AppTextStyles.subtitle.copyWith(
                          fontSize: 11,
                          color: AppColors.getTextSecondary(context),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Ketuk untuk lihat →',
                        style: AppTextStyles.subtitle.copyWith(
                          fontSize: 11,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} menit yang lalu';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} jam yang lalu';
    } else {
      return '${diff.inDays} hari yang lalu';
    }
  }
}
