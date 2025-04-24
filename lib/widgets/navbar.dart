import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/personal_info.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const Navbar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    void _showMobileMenu() {
      showModalBottomSheet(
        context: context,
        backgroundColor: colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.of(context).pop();
                    onHomePressed();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.of(context).pop();
                    onAboutPressed();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.work),
                  title: const Text('Projects'),
                  onTap: () {
                    Navigator.of(context).pop();
                    onProjectsPressed();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text('Contact'),
                  onTap: () {
                    Navigator.of(context).pop();
                    onContactPressed();
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            PersonalInfo.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ).animate().fadeIn(duration: 600.ms),
          if (!isMobile)
            Row(
              children: [
                _NavItem(
                  text: 'Home',
                  onTap: onHomePressed,
                ),
                const SizedBox(width: 30),
                _NavItem(
                  text: 'About',
                  onTap: onAboutPressed,
                ),
                const SizedBox(width: 30),
                _NavItem(
                  text: 'Projects',
                  onTap: onProjectsPressed,
                ),
                const SizedBox(width: 30),
                _NavItem(
                  text: 'Contact',
                  onTap: onContactPressed,
                ),
              ],
            ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2)
          else
            IconButton(
              onPressed: _showMobileMenu,
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: colorScheme.primary,
              ),
            ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.primary.withOpacity(0.1),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
} 