import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/colors.dart';
import '../../../core/design_system/glass_container.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onViewWork;
  final VoidCallback? onContact;

  const HeroSection({super.key, this.onViewWork, this.onContact});

  Future<void> _downloadCV() async {
    final Uri url = Uri.parse(
      'https://drive.google.com/file/d/YOUR_CV_FILE_ID/view?usp=sharing',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch CV link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1024;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: isMobile
          ? Column(
              children: [
                _buildTextContent(isMobile),
                const SizedBox(height: 60),
                _buildImageContent(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 5, child: _buildTextContent(isMobile)),
                Expanded(flex: 4, child: _buildImageContent()),
              ],
            ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlassContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: 30,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: accentCyan,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Available for new projects',
                style: TextStyle(
                  color: accentCyan,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Full-Stack\nMobile Developer',
          style: TextStyle(
            fontSize: isMobile ? 42 : 56,
            fontWeight: FontWeight.w800,
            height: 1.1,
            letterSpacing: -1.5,
            color: white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Flutter  \u2022  Python  \u2022  FastAPI',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: accentCyan,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'With 2+ years of professional experience in software houses, '
          'I build performant mobile apps with Flutter and robust backend APIs with '
          'Python & FastAPI. From POS systems to LMS platforms \u2014 I deliver '
          'end-to-end solutions that scale.',
          style: TextStyle(fontSize: 18, height: 1.6, color: textPrimary),
        ),
        const SizedBox(height: 40),
        _buildStatsRow(),
        const SizedBox(height: 48),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildPrimaryButton(),
            _buildSecondaryButton(),
            _buildCVButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatItem('5+', 'Projects'),
        _buildStatDivider(),
        _buildStatItem('1.5+', 'Years Exp'),
        _buildStatDivider(),
        _buildStatItem('10k+', 'Downloads'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: accentCyan,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 40,
      color: glassBorder,
    );
  }

  Widget _buildPrimaryButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onViewWork,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: accentCyan,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: accentCyan.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Text(
            'View Work',
            style: TextStyle(
              color: backgroundDark,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onContact,
        child: GlassContainer(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: const Text(
            'Contact Me',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCVButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _downloadCV,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accentCyan),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.download, color: accentCyan, size: 18),
              SizedBox(width: 8),
              Text(
                'Download CV',
                style: TextStyle(
                  color: accentCyan,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: backgroundPurple.withOpacity(0.4),
                blurRadius: 100,
                spreadRadius: 20,
              ),
            ],
          ),
        ),
        Container(
          width: 360,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: glassBorder),
            image: const DecorationImage(
              image: AssetImage('assets/images/software_engineer.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 40,
          left: -20,
          child: GlassContainer(
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            borderRadius: 20,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified, color: accentCyan, size: 24),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Open to Work',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mobile & Backend',
                      style: TextStyle(color: textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
