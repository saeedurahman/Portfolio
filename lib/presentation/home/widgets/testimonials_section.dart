import 'package:flutter/material.dart';
import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/core/design_system/glass_container.dart';

class _TestimonialData {
  final String quote;
  final String name;
  final String role;

  const _TestimonialData({
    required this.quote,
    required this.name,
    required this.role,
  });
}

const _testimonials = <_TestimonialData>[
  _TestimonialData(
    quote:
        'Saeed delivered a polished Flutter app ahead of schedule. His attention to detail '
        'and understanding of clean architecture made the codebase easy to maintain and extend.',
    name: 'Project Manager',
    role: 'Software House',
  ),
  _TestimonialData(
    quote:
        'Great communication and technical skills. He built our POS module with offline '
        'support and Bluetooth printing \u2014 features that our clients love.',
    name: 'Team Lead',
    role: 'Enterprise Client',
  ),
  _TestimonialData(
    quote:
        'Saeed is a self-driven developer who constantly improves. His ability to work with '
        'both Flutter frontend and FastAPI backend makes him a valuable full-stack contributor.',
    name: 'Senior Developer',
    role: 'Colleague',
  ),
];

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What People Say',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Feedback from colleagues and clients I\u2019ve worked with.',
          style: TextStyle(fontSize: 18, color: textSecondary),
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: _testimonials
                    .map(
                      (t) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _TestimonialCard(data: t),
                      ),
                    )
                    .toList(),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24,
                children: _testimonials
                    .map(
                      (t) => Expanded(child: _TestimonialCard(data: t)),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class _TestimonialCard extends StatefulWidget {
  final _TestimonialData data;
  const _TestimonialCard({required this.data});

  @override
  State<_TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<_TestimonialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        child: GlassContainer(
          padding: const EdgeInsets.all(28),
          borderColor: _isHovered ? accentCyan.withValues(alpha: 0.4) : glassBorder,
          backgroundColor:
              _isHovered ? accentCyan.withValues(alpha: 0.03) : glassBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.format_quote,
                color: accentCyan.withValues(alpha: 0.4),
                size: 36,
              ),
              const SizedBox(height: 16),
              Text(
                widget.data.quote,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: textPrimary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: backgroundPurple.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.data.name[0],
                        style: const TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.name,
                        style: const TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.data.role,
                        style: const TextStyle(
                          color: textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
