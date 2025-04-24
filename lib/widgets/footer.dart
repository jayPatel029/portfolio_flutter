import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/personal_info.dart';

class Footer extends StatelessWidget {
  // final VoidCallback onHomePressed;
  // final VoidCallback onAboutPressed;
  // final VoidCallback onProjectsPressed;
  // final VoidCallback onContactPressed;

  const Footer({
    super.key,
    // required this.onHomePressed,
    // required this.onAboutPressed,
    // required this.onProjectsPressed,
    // required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.05),
      ),
      child: Column(
        children: [
          if (!isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PersonalInfo.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondary,
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                    const SizedBox(height: 16),
                    Text(
                      PersonalInfo.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.secondary.withOpacity(0.8),
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Quick Links',
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: colorScheme.secondary,
                //       ),
                //     ).animate().fadeIn(duration: 600.ms),
                //     const SizedBox(height: 16),
                //     _FooterLink(
                //       text: 'Home',
                //       onTap: onHomePressed,
                //     ),
                //     const SizedBox(height: 8),
                //     _FooterLink(
                //       text: 'About',
                //       onTap: onAboutPressed,
                //     ),
                //     const SizedBox(height: 8),
                //     _FooterLink(
                //       text: 'Projects',
                //       onTap: onProjectsPressed,
                //     ),
                //     const SizedBox(height: 8),
                //     _FooterLink(
                //       text: 'Contact',
                //       onTap: onContactPressed,
                //     ),
                //   ],
                // ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondary,
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _SocialIcon(
                          icon: FontAwesomeIcons.github,
                          url: PersonalInfo.githubUrl,
                        ),
                        const SizedBox(width: 16),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedin,
                          url: PersonalInfo.linkedinUrl,
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms),
                  ],
                ),
              ],
            )
          else
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      PersonalInfo.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondary,
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                    const SizedBox(height: 16),
                    Text(
                      PersonalInfo.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.secondary.withOpacity(0.8),
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                  ],
                ),
                const SizedBox(height: 40),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Quick Links',
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: colorScheme.secondary,
                //       ),
                //     ).animate().fadeIn(duration: 600.ms),
                //     const SizedBox(height: 16),
                //     _FooterLink(
                //       text: 'Home',
                //       onTap: onHomePressed,
                //     ),
                //     const SizedBox(height: 8),
                //     _FooterLink(
                //       text: 'About',
                //       onTap: onAboutPressed,
                //     ),
                //     const SizedBox(height: 8),
                //     _FooterLink(
                //       text: 'Projects',
                //       onTap: onProjectsPressed,
                //     ),
                //     const SizedBox(height: 8),
                //     _FooterLink(
                //       text: 'Contact',
                //       onTap: onContactPressed,
                //     ),
                //   ],
                // ),

                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Connect',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondary,
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialIcon(
                          icon: FontAwesomeIcons.github,
                          url: PersonalInfo.githubUrl,
                        ),
                        const SizedBox(width: 16),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedin,
                          url: PersonalInfo.linkedinUrl,
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 40),
          Container(
            height: 1,
            color: colorScheme.primary.withOpacity(0.1),
          ),
          const SizedBox(height: 20),
          Text(
            'Built with Flutter & ❤️ by ${PersonalInfo.name}',
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.secondary.withOpacity(0.8),
            ),
          ).animate().fadeIn(duration: 600.ms),
        ],
      ),
    );
  }
}

// class _FooterLink extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap;

//   const _FooterLink({
//     required this.text,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             color: colorScheme.secondary.withOpacity(0.8),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: FaIcon(
            icon,
            color: colorScheme.primary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
