import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/personal_info.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          Text(
            'Achievements & Certifications',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'My notable accomplishments',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PersonalInfo.achievements.length,
            separatorBuilder: (context, index) => Divider(
              color: colorScheme.primary.withOpacity(0.1),
              height: 40,
            ),
            itemBuilder: (context, index) {
              final achievement = PersonalInfo.achievements[index];
              return _AchievementItem(
                title: achievement['title']!,
                description: achievement['description']!,
              ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2);
            },
          ),
        ],
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final String title;
  final String description;

  const _AchievementItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: FaIcon(
            FontAwesomeIcons.trophy,
            size: isMobile ? 16 : 20,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: colorScheme.secondary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 