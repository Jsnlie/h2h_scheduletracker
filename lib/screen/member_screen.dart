import 'package:flutter/material.dart';
import '../data/member_data.dart';
import '../models/member_model.dart';
import '../theme/app_colors.dart';
import '../widgets/group_info.dart';
import '../widgets/member.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  MemberModel _getNextBirthdayMember() {
    MemberModel? nextMember;
    int minDays = 366;

    for (final member in membersData) {
      final days = member.daysUntilNextBirthday();
      if (days < minDays) {
        minDays = days;
        nextMember = member;
      }
    }

    return nextMember ?? membersData.first;
  }

  @override
  Widget build(BuildContext context) {
    final nextBirthdayMember = _getNextBirthdayMember();
    final daysRemaining = nextBirthdayMember.daysUntilNextBirthday();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Members',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GroupInfo(),

            // Birthday Countdown Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE1F5FE), Color(0xFFFCE4EC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Text('🎉', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Upcoming Member Birthday',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          daysRemaining == 0
                              ? "Today is ${nextBirthdayMember.stageName}'s Birthday! 🎂"
                              : "${nextBirthdayMember.stageName}'s Birthday in $daysRemaining days (${nextBirthdayMember.birthday.split(',').first})",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    nextBirthdayMember.representativeEmoji,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Section Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Members (8)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Tap card for full profile',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            // Members List
            ...membersData.map((member) => MemberCard(member: member)),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
