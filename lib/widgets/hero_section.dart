import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/personal_info.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: isMobile ? null : screenHeight,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 32 : 80,
      ),
      child: isMobile
          ? _buildMobileLayout(context, colorScheme)
          : _buildDesktopLayout(context, colorScheme),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, I\'m',
                style: TextStyle(
                  fontSize: 24,
                  color: colorScheme.secondary,
                ),
              ).animate().fadeIn(duration: 600.ms),
              const SizedBox(height: 16),
              Text(
                PersonalInfo.name,
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
              const SizedBox(height: 16),
              Text(
                PersonalInfo.title,
                style: TextStyle(
                  fontSize: 24,
                  color: colorScheme.secondary,
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
              const SizedBox(height: 32),
              Text(
                PersonalInfo.bio,
                style: TextStyle(
                  fontSize: 18,
                  color: colorScheme.secondary.withOpacity(0.8),
                  height: 1.6,
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
              const SizedBox(height: 40),
              _buildButtons(context, colorScheme),
              const SizedBox(height: 40),
              _buildSocialIcons(context),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: _buildProfileImage(context, colorScheme),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildProfileImage(context, colorScheme),
          const SizedBox(height: 24),
          Text(
            'Hi, I\'m',
            style: TextStyle(
              fontSize: 20,
              color: colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 12),
          Text(
            PersonalInfo.name,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),
          const SizedBox(height: 12),
          Text(
            PersonalInfo.title,
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),
          const SizedBox(height: 20),
          Text(
            PersonalInfo.bio,
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.secondary.withOpacity(0.8),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),
          const SizedBox(height: 24),
          _buildButtons(context, colorScheme),
          const SizedBox(height: 24),
          _buildSocialIcons(context),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildProfileImage(BuildContext context, ColorScheme colorScheme) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final size = isMobile ? 180.0 : 400.0;
    final innerSize = isMobile ? 160.0 : 350.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withOpacity(0.2),
            colorScheme.tertiary.withOpacity(0.2),
          ],
        ),
      ),
      child: Center(
        child: Container(
          width: innerSize,
          height: innerSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.primary,
              width: 4,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Decorative circles
              ...List.generate(3, (index) {
                return Positioned(
                  top: index * 30.0,
                  left: index * 30.0,
                  child: Container(
                    width: innerSize - (index * 60.0),
                    height: innerSize - (index * 60.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                  ),
                );
              }),
              // Initials
              Text(
                'JP',
                style: TextStyle(
                  fontSize: isMobile ? 48 : 96,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).scale(
          begin: const Offset(0.8, 0.8),
          curve: Curves.easeOutBack,
        );
  }

  Widget _buildButtons(BuildContext context, ColorScheme colorScheme) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return isMobile
        ? Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onContactPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Contact Me'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    _launchUrl(PersonalInfo.cvLink);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Download CV'),
                ),
              ),
            ],
          )
        : Row(
            children: [
              ElevatedButton(
                onPressed: onContactPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('Contact Me'),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {
                  _launchUrl(PersonalInfo.cvLink);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('Download CV'),
              ),
            ],
          );
  }

  Widget _buildSocialIcons(BuildContext context) {
    return Row(
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
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
}

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
          // final uri = Uri.parse(url);
          _launchUrl(url);
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

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
