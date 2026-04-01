import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/design_system/glass_container.dart';

class _ServiceData {
  final IconData icon;
  final String title;
  final String description;
  final List<String> highlights;

  const _ServiceData({
    required this.icon,
    required this.title,
    required this.description,
    required this.highlights,
  });
}

const _services = <_ServiceData>[
  _ServiceData(
    icon: Icons.phone_android,
    title: 'Mobile App Development',
    description:
        'Cross-platform mobile applications built with Flutter for iOS and Android '
        'with native performance and beautiful UI.',
    highlights: ['iOS & Android', 'Offline-First', 'App Store Ready'],
  ),
  _ServiceData(
    icon: Icons.dns,
    title: 'Backend API Development',
    description:
        'Scalable RESTful APIs built with Python and FastAPI, including authentication, '
        'database design, and deployment.',
    highlights: ['FastAPI', 'PostgreSQL', 'JWT Auth'],
  ),
  _ServiceData(
    icon: Icons.design_services,
    title: 'UI/UX Implementation',
    description:
        'Pixel-perfect, responsive designs translated from Figma to Flutter '
        'with smooth animations and intuitive user experiences.',
    highlights: ['Responsive', 'Animations', 'Figma to Code'],
  ),
  _ServiceData(
    icon: Icons.build_circle,
    title: 'Maintenance & Support',
    description:
        'Ongoing app maintenance, performance optimization, bug fixes, '
        'feature updates, and technical consultation.',
    highlights: ['Bug Fixes', 'Performance', 'Updates'],
  ),
];

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What I Offer',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'End-to-end development services to bring your ideas to life.',
          style: TextStyle(fontSize: 18, color: textSecondary),
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: _services
                    .map(
                      (s) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _ServiceCard(data: s),
                      ),
                    )
                    .toList(),
              )
            : Wrap(
                spacing: 24,
                runSpacing: 24,
                children:
                    _services.map((s) => _ServiceCard(data: s)).toList(),
              ),
      ],
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final _ServiceData data;
  const _ServiceCard({required this.data});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        child: GlassContainer(
          width: isMobile ? double.infinity : 280,
          padding: const EdgeInsets.all(28),
          backgroundColor:
              _isHovered ? accentCyan.withOpacity(0.05) : glassBackground,
          borderColor: _isHovered ? accentCyan.withOpacity(0.4) : glassBorder,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: accentCyan.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: accentCyan.withOpacity(0.2)),
                ),
                child: Icon(
                  widget.data.icon,
                  color: accentCyan,
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.data.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.data.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.data.highlights
                    .map(
                      (h) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundPurple.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          h,
                          style: const TextStyle(
                            color: accentCyan,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
