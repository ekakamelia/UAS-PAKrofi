import 'package:flutter/material.dart';
import 'package:celeoe/core/theme.dart';
import 'package:celeoe/core/dummy_data.dart';

class AnnouncementBanner extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementBanner({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
           const Icon(Icons.info_outline, color: Colors.white, size: 28),
           const SizedBox(width: 12),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   announcement.title,
                   style: AppTextStyles.title.copyWith(color: Colors.white, fontSize: 16),
                 ),
                 Text(
                   announcement.description,
                   style: AppTextStyles.body.copyWith(color: Colors.white70, fontSize: 12),
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                 ),
               ],
             ),
           ),
        ],
      ),
    );
  }
}
