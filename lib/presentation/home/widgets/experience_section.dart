import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/design_system/glass_container.dart';

class _ExperienceData {
  final String period;
  final String role;
  final String company;
  final String description;
  final List<String> highlights;
  final bool isCurrent;

  const _ExperienceData({
    required this.period,
    required this.role,
    required this.company,
    required this.description,
    required this.highlights,
    this.isCurrent = false,
  });
}

const _experiences = <_ExperienceData>[
  _ExperienceData(
    period: '2025 \u2013 Present',
    role: 'Flutter Developer',
    company: 'Software House',
    description:
        'Building enterprise-grade mobile applications including POS and LMS systems. '
        'Working with cross-functional teams to deliver scalable, high-performance solutions.',
    highlights: [
      'POS System with Bluetooth printing & offline sync',
      'LMS Platform with video streaming & grading',
      'FastAPI backend development for internal tools',
      'Clean Architecture & BLoC pattern implementation',
    ],
    isCurrent: true,
  ),
  _ExperienceData(
    period: '2024 \u2013 2025',
    role: 'Junior Flutter Developer',
    company: 'Freelance & Software Houses',
    description:
        'Started professional journey building mobile apps and learning industry best practices. '
        'Published first app on Play Store with 10k+ downloads.',
    highlights: [
      'Published Digital Madrasa on Google Play Store',
      'Learned state management (BLoC, GetX)',
      'Firebase integration & real-time features',
      'Responsive UI development for web & mobile',
    ],
  ),
  _ExperienceData(
    period: '2023 \u2013 2024',
    role: 'Self-taught Developer',
    company: 'Learning Phase',
    description:
        'Intensive self-learning phase covering Flutter, Dart, Python, and software engineering fundamentals.',
    highlights: [
      'Completed Flutter & Dart courses',
      'Learned Python & FastAPI for backend',
      'Built first personal projects',
      'Studied Clean Architecture & SOLID principles',
    ],
  ),
];

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Experience',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'My professional journey and growth as a developer.',
          style: TextStyle(fontSize: 18, color: textSecondary),
        ),
        const SizedBox(height: 48),
        ...List.generate(_experiences.length, (index) {
          final exp = _experiences[index];
          final isLast = index == _experiences.length - 1;
          return _TimelineEntry(
            data: exp,
            isLast: isLast,
          );
        }),
      ],
    );
  }
}

class _TimelineEntry extends StatefulWidget {
  final _ExperienceData data;
  final bool isLast;

  const _TimelineEntry({required this.data, required this.isLast});

  @override
  State<_TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<_TimelineEntry> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile) ...[
              SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.data.period,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: widget.data.isCurrent
                              ? accentCyan
                              : textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.data.isCurrent) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: accentCyan.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: accentCyan.withOpacity(0.3),
                            ),
                          ),
                          child: const Text(
                            'Current',
                            style: TextStyle(
                              color: accentCyan,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 24),
            ],
            _buildTimelineLine(),
            const SizedBox(width: 24),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: widget.isLast ? 0 : 40,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(
                    _isHovered ? 4 : 0,
                    0,
                    0,
                  ),
                  child: GlassContainer(
                    padding: const EdgeInsets.all(28),
                    borderColor: _isHovered
                        ? accentCyan.withOpacity(0.4)
                        : glassBorder,
                    backgroundColor: _isHovered
                        ? accentCyan.withOpacity(0.03)
                        : glassBackground,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isMobile) ...[
                          Text(
                            widget.data.period,
                            style: TextStyle(
                              color: widget.data.isCurrent
                                  ? accentCyan
                                  : textSecondary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        Text(
                          widget.data.role,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.data.company,
                          style: const TextStyle(
                            fontSize: 15,
                            color: accentCyan,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.data.description,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: textSecondary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...widget.data.highlights.map(
                          (h) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: accentCyan,
                                    size: 14,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    h,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: textPrimary,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineLine() {
    return Column(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: widget.data.isCurrent
                ? accentCyan
                : accentCyan.withOpacity(0.3),
            shape: BoxShape.circle,
            boxShadow: widget.data.isCurrent
                ? [
                    BoxShadow(
                      color: accentCyan.withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
        ),
        if (!widget.isLast)
          Expanded(
            child: Container(
              width: 2,
              color: glassBorder,
            ),
          ),
      ],
    );
  }
}
