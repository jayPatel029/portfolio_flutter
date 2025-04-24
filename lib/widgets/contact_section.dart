import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/personal_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 20),
          Text(
            'Let\'s work together',
            style: TextStyle(
              fontSize: 18,
              color: colorScheme.secondary,
            ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 60),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile) ...[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                      const SizedBox(height: 30),
                      _ContactInfoItem(
                        icon: FontAwesomeIcons.envelope,
                        title: 'Email',
                        value: PersonalInfo.email,
                        onTap: () => _launchUrl('mailto:${PersonalInfo.email}'),
                      ),
                      const SizedBox(height: 20),
                      _ContactInfoItem(
                        icon: FontAwesomeIcons.phone,
                        title: 'Phone',
                        value: PersonalInfo.phone,
                        onTap: () => _launchUrl('tel:${PersonalInfo.phone}'),
                      ),
                      const SizedBox(height: 20),
                      _ContactInfoItem(
                        icon: FontAwesomeIcons.mapMarkerAlt,
                        title: 'Location',
                        value: PersonalInfo.location,
                        onTap: () => _launchUrl('https://maps.google.com'),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Follow Me',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                      const SizedBox(height: 20),
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
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Send a Message',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2),
                      const SizedBox(height: 30),
                      _ContactForm(),
                    ],
                  ),
                ),
              ] else ...[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(duration: 600.ms),
                      const SizedBox(height: 30),
                      _ContactInfoItem(
                        icon: FontAwesomeIcons.envelope,
                        title: 'Email',
                        value: PersonalInfo.email,
                        onTap: () => _launchUrl('mailto:${PersonalInfo.email}'),
                      ),
                      const SizedBox(height: 20),
                      _ContactInfoItem(
                        icon: FontAwesomeIcons.phone,
                        title: 'Phone',
                        value: PersonalInfo.phone,
                        onTap: () => _launchUrl('tel:${PersonalInfo.phone}'),
                      ),
                      const SizedBox(height: 20),
                      _ContactInfoItem(
                        icon: FontAwesomeIcons.mapMarkerAlt,
                        title: 'Location',
                        value: PersonalInfo.location,
                        onTap: () => _launchUrl('https://maps.google.com'),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Follow Me',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(duration: 600.ms),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 40),
                      Text(
                        'Send a Message',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(duration: 600.ms),
                      const SizedBox(height: 30),
                      _ContactForm(),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.value,
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
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
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.secondary.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final url = Uri.parse(PersonalInfo.formLink);
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'message': _messageController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message sent successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          _formKey.currentState!.reset();
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to send message. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isLoading ? null : _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Send Message'),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
}
