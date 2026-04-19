import 'package:flutter/material.dart';
import 'package:alperefesahin_dev/core/constants/colors.dart';

class HeaderNavigation extends StatefulWidget {
  final Function(int) onMenuTapped;

  const HeaderNavigation({super.key, required this.onMenuTapped});

  @override
  State<HeaderNavigation> createState() => _HeaderNavigationState();
}

class _HeaderNavigationState extends State<HeaderNavigation> {
  int _hoveredIndex = -1;
  final List<String> _menuItems = [
    'Services',
    'Skills',
    'Work',
    'Experience',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Saeed Ur Rehman',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: white,
            ),
          ),
          if (isMobile)
            _buildMobileMenu()
          else
            Row(
              spacing: 28,
              children: List.generate(_menuItems.length, (index) {
                final isHovered = _hoveredIndex == index;
                return MouseRegion(
                  onEnter: (_) => setState(() => _hoveredIndex = index),
                  onExit: (_) => setState(() => _hoveredIndex = -1),
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => widget.onMenuTapped(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _menuItems[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: isHovered ? accentCyan : textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          height: 2,
                          width: isHovered ? 24 : 0,
                          color: accentCyan,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileMenu() {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: white),
      color: backgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: glassBorder),
      ),
      onSelected: widget.onMenuTapped,
      itemBuilder: (context) => List.generate(
        _menuItems.length,
        (index) => PopupMenuItem<int>(
          value: index,
          child: Text(
            _menuItems[index],
            style: const TextStyle(color: textPrimary),
          ),
        ),
      ),
    );
  }
}
