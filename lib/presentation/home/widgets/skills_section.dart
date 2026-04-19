import 'package:flutter/material.dart';
import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/core/design_system/glass_container.dart';

class _SkillCategory {
  final String name;
  final IconData icon;
  final List<_Skill> skills;

  const _SkillCategory({
    required this.name,
    required this.icon,
    required this.skills,
  });
}

class _Skill {
  final IconData icon;
  final String title;
  final String subtitle;

  const _Skill({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

const _categories = <_SkillCategory>[
  _SkillCategory(
    name: 'Mobile',
    icon: Icons.phone_android,
    skills: [
      _Skill(
        icon: Icons.flutter_dash,
        title: 'Flutter',
        subtitle: 'Cross-platform UI',
      ),
      _Skill(
        icon: Icons.code,
        title: 'Dart',
        subtitle: 'Primary Language',
      ),
      _Skill(
        icon: Icons.architecture,
        title: 'BLoC / Cubit',
        subtitle: 'State Management',
      ),
      _Skill(
        icon: Icons.sync_alt,
        title: 'GetX',
        subtitle: 'Reactive State',
      ),
      _Skill(
        icon: Icons.local_fire_department,
        title: 'Firebase',
        subtitle: 'Auth, DB, Storage',
      ),
    ],
  ),
  _SkillCategory(
    name: 'Backend',
    icon: Icons.dns,
    skills: [
      _Skill(
        icon: Icons.terminal,
        title: 'Python',
        subtitle: 'Backend Language',
      ),
      _Skill(
        icon: Icons.bolt,
        title: 'FastAPI',
        subtitle: 'REST Framework',
      ),
      _Skill(
        icon: Icons.api,
        title: 'REST APIs',
        subtitle: 'API Design',
      ),
      _Skill(
        icon: Icons.storage,
        title: 'PostgreSQL',
        subtitle: 'Relational DB',
      ),
      _Skill(
        icon: Icons.security,
        title: 'JWT Auth',
        subtitle: 'Authentication',
      ),
    ],
  ),
  _SkillCategory(
    name: 'Tools & Design',
    icon: Icons.build,
    skills: [
      _Skill(
        icon: Icons.merge_type,
        title: 'Git & GitHub',
        subtitle: 'Version Control',
      ),
      _Skill(
        icon: Icons.design_services,
        title: 'UI/UX',
        subtitle: 'Responsive Design',
      ),
      _Skill(
        icon: Icons.science,
        title: 'Postman',
        subtitle: 'API Testing',
      ),
      _Skill(
        icon: Icons.rocket_launch,
        title: 'CI/CD',
        subtitle: 'Deployment',
      ),
      _Skill(
        icon: Icons.layers,
        title: 'Clean Arch',
        subtitle: 'Code Structure',
      ),
    ],
  ),
];

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tech Stack',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Tools and technologies I use to build modern applications.',
          style: TextStyle(fontSize: 18, color: textSecondary),
        ),
        const SizedBox(height: 32),
        _buildCategoryTabs(),
        const SizedBox(height: 40),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: Wrap(
            key: ValueKey(_selectedCategory),
            spacing: 20,
            runSpacing: 20,
            children: _categories[_selectedCategory].skills
                .map(
                  (skill) => _AnimatedSkillCard(
                    icon: skill.icon,
                    title: skill.title,
                    subtitle: skill.subtitle,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(_categories.length, (index) {
        final cat = _categories[index];
        final isSelected = _selectedCategory == index;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => setState(() => _selectedCategory = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? accentCyan.withValues(alpha: 0.15)
                    : glassBackground,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? accentCyan : glassBorder,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    cat.icon,
                    color: isSelected ? accentCyan : textSecondary,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cat.name,
                    style: TextStyle(
                      color: isSelected ? accentCyan : textSecondary,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _AnimatedSkillCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AnimatedSkillCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<_AnimatedSkillCard> createState() => _AnimatedSkillCardState();
}

class _AnimatedSkillCardState extends State<_AnimatedSkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 0, end: -6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _isHovered ? -4 : _floatAnimation.value),
            child: AnimatedScale(
              scale: _isHovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: GlassContainer(
                width: 320,
                padding: const EdgeInsets.all(24),
                backgroundColor: _isHovered
                    ? glassBackground.withValues(alpha: 0.2)
                    : glassBackground,
                borderColor:
                    _isHovered ? accentCyan.withValues(alpha: 0.5) : glassBorder,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: backgroundDark.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.icon,
                        color: accentCyan,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
