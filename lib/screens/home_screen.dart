import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/achievements_section.dart';
import '../widgets/mini_projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isScrolled = _scrollController.offset > 100;
    });
  }

  void _scrollToSection(String section) {
    final context = _sectionKeys[section]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                key: _sectionKeys['home'],
                child: HeroSection(
                  onContactPressed: () => _scrollToSection('contact'),
                ),
              ),
              SliverToBoxAdapter(
                key: _sectionKeys['about'],
                child: const AboutSection(),
              ),
              SliverToBoxAdapter(
                key: _sectionKeys['projects'],
                child: const ProjectsSection(),
              ),
              const SliverToBoxAdapter(
                child: AchievementsSection(),
              ),
              const SliverToBoxAdapter(
                child: MiniProjectsSection(),
              ),
              SliverToBoxAdapter(
                key: _sectionKeys['contact'],
                child: const ContactSection(

                ),
              ),
              const SliverToBoxAdapter(
                child: Footer(),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _isScrolled ? 0 : -100,
            left: 0,
            right: 0,
            child: Navbar(
              onHomePressed: () => _scrollToSection('home'),
              onAboutPressed: () => _scrollToSection('about'),
              onProjectsPressed: () => _scrollToSection('projects'),
              onContactPressed: () => _scrollToSection('contact'),
            ),
          ),
          if (!_isScrolled)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _scrollController.animateTo(
                        100,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: colorScheme.primary,
                        size: 32,
                      ),
                    ).animate(
                      onPlay: (controller) => controller.repeat(),
                    ).slideY(
                      begin: 0,
                      end: 0.2,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
} 