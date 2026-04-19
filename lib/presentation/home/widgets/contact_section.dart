import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/core/design_system/glass_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchWhatsApp() async {
    final Uri url = Uri.parse(
      'https://wa.me/923442259592?text=Hi%20Saeed,%20I%20am%20interested%20in%20working%20with%20you!',
    );
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'saeedurahman760@gmail.com',
      queryParameters: {
        'subject': 'Project Inquiry',
        'body': 'Hi Saeed, I would like to discuss a project with you.',
      },
    );
    if (!await launchUrl(emailUri)) {
      debugPrint('Could not launch email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          "Let's Build Something Amazing",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: white,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "I'm currently available for freelance projects and full-time opportunities.\nWhether you need a mobile app, a backend API, or a full-stack solution — let's talk!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textSecondary, height: 1.6),
        ),
        const SizedBox(height: 48),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _launchWhatsApp,
            child: GlassContainer(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              backgroundColor: accentCyan.withValues(alpha: 0.1),
              borderColor: accentCyan,
              borderRadius: 30,
              child: const Text(
                'Say Hello',
                style: TextStyle(
                  color: accentCyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            _AnimatedSocialIcon(
              icon: Icons.code,
              tooltip: 'GitHub',
              onTap: () => _launchUrl('https://github.com/saeedurahman'),
            ),
            _AnimatedSocialIcon(
              icon: Icons.workspace_premium,
              tooltip: 'LinkedIn',
              onTap: () => _launchUrl(
                'https://www.linkedin.com/in/saeeddeveloper/',
              ),
            ),
            _AnimatedSocialIcon(
              icon: Icons.email,
              tooltip: 'Email',
              onTap: _launchEmail,
            ),
          ],
        ),
        const SizedBox(height: 60),
        const Text(
          'Designed & Built by Saeed \u00a9 2026',
          style: TextStyle(
            color: textSecondary,
            fontSize: 14,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _AnimatedSocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _AnimatedSocialIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<_AnimatedSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Tooltip(
          message: widget.tooltip,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  _isHovered ? accentCyan.withValues(alpha: 0.2) : glassBackground,
              shape: BoxShape.circle,
              border:
                  Border.all(color: _isHovered ? accentCyan : glassBorder),
            ),
            child: Icon(
              widget.icon,
              color: _isHovered ? accentCyan : textSecondary,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
