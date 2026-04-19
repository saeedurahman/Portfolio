import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/core/design_system/glass_container.dart';

class _ProjectData {
  final String title;
  final String description;
  final List<String> techStack;
  final List<Map<String, String>> stats;
  final String roleType;
  final IconData icon;
  final String? link;

  const _ProjectData({
    required this.title,
    required this.description,
    required this.techStack,
    required this.stats,
    required this.roleType,
    required this.icon,
    this.link,
  });
}

const _projects = <_ProjectData>[
  _ProjectData(
    title: 'POS System',
    description:
        'A full-featured Point of Sale system built for retail businesses. Includes inventory management, '
        'Bluetooth thermal printing, real-time sales analytics, and offline-first architecture with sync capabilities.',
    techStack: ['Flutter', 'FastAPI', 'PostgreSQL', 'BLoC'],
    stats: [
      {'label': 'Modules', 'value': '12+'},
      {'label': 'Type', 'value': 'Enterprise'},
    ],
    roleType: 'Professional',
    icon: Icons.point_of_sale,
  ),
  _ProjectData(
    title: 'Digital Madrasa',
    description:
        'A comprehensive educational platform built with Flutter. Features include real-time progress tracking, '
        'video lessons, and interactive quizzes natively optimized for both iOS and Android.',
    techStack: ['Flutter', 'Firebase', 'BLoC/Cubit', 'REST API'],
    stats: [
      {'label': 'Downloads', 'value': '200+'},
      {'label': 'Rating', 'value': '4.8\u2605'},
    ],
    roleType: 'Personal',
    icon: Icons.school,
  ),
  _ProjectData(
    title: 'LMS Platform',
    description:
        'A Learning Management System for institutions with video streaming, assignment submission, '
        'grading dashboards, attendance tracking, and parent notification modules.',
    techStack: ['Flutter', 'REST API', 'BLoC', 'Video Player'],
    stats: [
      {'label': 'Users', 'value': '100+'},
      {'label': 'Type', 'value': 'Enterprise'},
    ],
    roleType: 'Professional',
    icon: Icons.cast_for_education,
  ),
  _ProjectData(
    title: 'FastAPI Backend Service',
    description:
        'A production-ready RESTful API backend with JWT authentication, role-based access control, '
        'database migrations, and auto-generated OpenAPI documentation.',
    techStack: ['Python', 'FastAPI', 'PostgreSQL', 'JWT Auth'],
    stats: [
      {'label': 'Endpoints', 'value': '40+'},
      {'label': 'Type', 'value': 'Backend'},
    ],
    roleType: 'Personal',
    icon: Icons.api,
    link: 'https://github.com/saeedurrahman',
  ),
  _ProjectData(
    title: 'Portfolio Website',
    description:
        'This very portfolio \u2014 a Flutter Web application with glassmorphism design, animated particles, '
        'clean architecture, and responsive layout. Built to showcase skills and projects.',
    techStack: ['Flutter Web', 'Hive', 'BLoC', 'Clean Architecture'],
    stats: [
      {'label': 'Sections', 'value': '8'},
      {'label': 'Type', 'value': 'Web App'},
    ],
    roleType: 'Personal',
    icon: Icons.web,
    link: 'https://github.com/saeedurrahman',
  ),
];

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/saeedurahman');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch GitHub');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Work',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Selected projects that showcase my capabilities across mobile and backend.',
                    style: TextStyle(fontSize: 18, color: textSecondary),
                  ),
                ],
              ),
            ),
            if (!isMobile) _buildViewAllButton(),
          ],
        ),
        const SizedBox(height: 40),
        ..._projects.map(
          (project) => Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: _AnimatedProjectCard(
              title: project.title,
              description: project.description,
              techStack: project.techStack,
              stats: project.stats,
              roleType: project.roleType,
              icon: project.icon,
              link: project.link,
              isMobile: isMobile,
            ),
          ),
        ),
        if (isMobile) Center(child: _buildViewAllButton()),
      ],
    );
  }

  Widget _buildViewAllButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchGitHub,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accentCyan),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View All on GitHub',
                style: TextStyle(
                  color: accentCyan,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: accentCyan, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final List<Map<String, String>> stats;
  final String roleType;
  final IconData icon;
  final String? link;
  final bool isMobile;

  const _AnimatedProjectCard({
    required this.title,
    required this.description,
    required this.techStack,
    required this.stats,
    required this.roleType,
    required this.icon,
    this.link,
    required this.isMobile,
  });

  @override
  State<_AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<_AnimatedProjectCard> {
  bool _isHovered = false;

  Future<void> _openLink() async {
    if (widget.link == null) return;
    final Uri url = Uri.parse(widget.link!);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor:
          widget.link != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.link != null ? _openLink : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          child: GlassContainer(
            borderRadius: 24,
            padding: EdgeInsets.zero,
            borderColor:
                _isHovered ? accentCyan.withValues(alpha: 0.5) : glassBorder,
            child: widget.isMobile
                ? Column(
                    children: [_buildIconArea(), _buildContentArea()],
                  )
                : IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(flex: 3, child: _buildContentArea()),
                        Expanded(flex: 2, child: _buildIconArea()),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentArea() {
    return Padding(
      padding: const EdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.roleType == 'Professional'
                      ? backgroundPurple.withValues(alpha: 0.3)
                      : accentCyan.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.roleType == 'Professional'
                        ? backgroundPurple.withValues(alpha: 0.6)
                        : accentCyan.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  widget.roleType,
                  style: TextStyle(
                    color: widget.roleType == 'Professional'
                        ? Colors.purpleAccent.shade100
                        : accentCyan,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                widget.techStack.map((tech) => _buildTechPill(tech)).toList(),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              ...widget.stats.map(
                (stat) => Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: _buildStat(stat['value']!, stat['label']!),
                ),
              ),
              if (widget.link != null) ...[
                const Spacer(),
                const Icon(
                  Icons.open_in_new,
                  color: accentCyan,
                  size: 20,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechPill(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: backgroundPurple.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: backgroundPurple.withValues(alpha: 0.5)),
      ),
      child: Text(
        tech,
        style: const TextStyle(
          color: accentCyan,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: textSecondary),
        ),
      ],
    );
  }

  Widget _buildIconArea() {
    return Container(
      height: widget.isMobile ? 200 : null,
      constraints: BoxConstraints(minHeight: widget.isMobile ? 200 : 300),
      decoration: BoxDecoration(
        color: backgroundDark.withValues(alpha: 0.5),
        border: Border(
          left: BorderSide(
            color: widget.isMobile ? Colors.transparent : glassBorder,
          ),
          top: BorderSide(
            color: widget.isMobile ? glassBorder : Colors.transparent,
          ),
        ),
      ),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(
            0,
            _isHovered ? -6 : 0,
            0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: accentCyan.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: accentCyan.withValues(alpha: 0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: accentCyan.withValues(alpha: _isHovered ? 0.3 : 0.1),
                      blurRadius: 30,
                      spreadRadius: _isHovered ? 5 : 0,
                    ),
                  ],
                ),
                child: Icon(widget.icon, color: accentCyan, size: 40),
              ),
              const SizedBox(height: 16),
              Text(
                widget.roleType == 'Professional'
                    ? 'Company Project'
                    : 'Side Project',
                style: const TextStyle(
                  color: textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
