import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/personal_info.dart';

class MiniProjectsSection extends StatelessWidget {
  const MiniProjectsSection({super.key});

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
            'Mini Projects',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Small projects and experiments',
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
            itemCount: PersonalInfo.miniProjects.length,
            separatorBuilder: (context, index) => Divider(
              color: colorScheme.primary.withOpacity(0.1),
              height: 40,
            ),
            itemBuilder: (context, index) {
              final project = PersonalInfo.miniProjects[index];
              return _MiniProjectItem(
                title: project['title'] as String,
                description: project['description'] as String,
                githubUrl: project['githubUrl'] as String,
                demoUrl: project['demoUrl'] as String,
              ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2);
            },
          ),
        ],
      ),
    );
  }
}

class _MiniProjectItem extends StatelessWidget {
  final String title;
  final String description;
  final String githubUrl;
  final String demoUrl;

  const _MiniProjectItem({
    required this.title,
    required this.description,
    required this.githubUrl,
    required this.demoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        const SizedBox(width: 20),
        Row(
          children: [
            IconButton(
              onPressed: () => _launchUrl(githubUrl),
              icon: FaIcon(
                FontAwesomeIcons.github,
                size: isMobile ? 16 : 18,
                color: colorScheme.primary,
              ),
              tooltip: 'View on GitHub',
            ),
            const SizedBox(width: 18),
            // IconButton(
            //   onPressed: () => _launchUrl(demoUrl),
            //   icon: FaIcon(
            //     FontAwesomeIcons.externalLinkAlt,
            //     size: isMobile ? 16 : 18,
            //     color: colorScheme.primary,
            //   ),
            //   tooltip: 'View Demo',
            // ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
