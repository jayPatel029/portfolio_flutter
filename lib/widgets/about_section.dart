import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/personal_info.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 32 : 80,
      ),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 16),
          Text(
            'Get to know me better',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: colorScheme.secondary,
            ),
          ).animate().fadeIn(duration: 600.ms),
          SizedBox(height: isMobile ? 32 : 60),
          isMobile
              ? _buildMobileLayout(context, colorScheme)
              : _buildDesktopLayout(context, colorScheme),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWhoAmI(context, colorScheme),
              const SizedBox(height: 30),
              _buildSkills(context, colorScheme),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: _buildExperience(context, colorScheme),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWhoAmI(context, colorScheme),
        const SizedBox(height: 32),
        _buildSkills(context, colorScheme),
        const SizedBox(height: 32),
        _buildExperience(context, colorScheme),
      ],
    );
  }

  Widget _buildWhoAmI(BuildContext context, ColorScheme colorScheme) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.secondary,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        const SizedBox(height: 16),
        Text(
          PersonalInfo.education + ' ' + PersonalInfo.bio,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: colorScheme.secondary.withOpacity(0.8),
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
      ],
    );
  }

  Widget _buildSkills(BuildContext context, ColorScheme colorScheme) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Skills',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.secondary,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.center,
          children: [
            _SkillChip(
              icon: FontAwesomeIcons.flutter,
              label: 'Flutter' ,
            ),
            _SkillChip(
              icon: FontAwesomeIcons.nodeJs,
              label: 'Node.js',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.code,
              label: 'TensorFlow',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.code,
              label: 'Scikit-learn',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.robot,
              label: 'Machine Learning',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.database,
              label: 'Database',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.python,
              label: 'Python',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.java,
              label: 'Java',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.js,
              label: 'JavaScript',
            ),
            _SkillChip(
              icon: FontAwesomeIcons.git,
              label: 'Git',
            ),
          ],
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
      ],
    );
  }

  Widget _buildExperience(BuildContext context, ColorScheme colorScheme) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.secondary,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2),
        const SizedBox(height: 16),
        ...PersonalInfo.experiences.map((experience) => Column(
          children: [
            _ExperienceItem(
              title: experience['title']!,
              company: experience['company']!,
              duration: experience['duration']!,
              description: experience['description']!,
            ),
            const SizedBox(height: 16),
          ],
        )),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SkillChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 14,
        vertical: isMobile ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: isMobile ? 14 : 16,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final String description;

  const _ExperienceItem({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
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
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.building,
                size: isMobile ? 12 : 14,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                company,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: colorScheme.secondary.withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 16),
              FaIcon(
                FontAwesomeIcons.clock,
                size: isMobile ? 12 : 14,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                duration,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: colorScheme.secondary.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: colorScheme.secondary.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
} 
