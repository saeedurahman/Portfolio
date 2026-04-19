import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/animated_background.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/code_snippet_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/contact_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/experience_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/header_navigation.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/hero_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/projects_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/services_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/skills_section.dart';
import 'package:alperefesahin_dev/presentation/home/widgets/testimonials_section.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(int index) {
    final keys = [
      _servicesKey,
      _skillsKey,
      _workKey,
      _experienceKey,
      _contactKey,
    ];

    if (index < 0 || index >= keys.length) return;

    final context = keys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _scrollToWork() => _scrollToSection(2);
  void _scrollToContact() => _scrollToSection(4);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: Stack(
        children: [
          const AnimatedBackground(),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width > 1024 ? 120 : 24,
                  vertical: 40,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HeaderNavigation(onMenuTapped: _scrollToSection),

                      const SizedBox(height: 60),

                      HeroSection(
                        onViewWork: _scrollToWork,
                        onContact: _scrollToContact,
                      ),

                      const SizedBox(height: 100),

                      Container(
                        key: _servicesKey,
                        child: const ServicesSection(),
                      ),

                      const SizedBox(height: 100),

                      Container(
                        key: _skillsKey,
                        child: const SkillsSection(),
                      ),

                      const SizedBox(height: 100),

                      const CodeSnippetSection(),

                      const SizedBox(height: 100),

                      Container(
                        key: _workKey,
                        child: const ProjectsSection(),
                      ),

                      const SizedBox(height: 100),

                      Container(
                        key: _experienceKey,
                        child: const ExperienceSection(),
                      ),

                      const SizedBox(height: 100),

                      const TestimonialsSection(),

                      Container(
                        key: _contactKey,
                        child: const ContactSection(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
