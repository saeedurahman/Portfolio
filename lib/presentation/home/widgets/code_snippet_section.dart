import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/design_system/glass_container.dart';

class CodeSnippetSection extends StatelessWidget {
  const CodeSnippetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Clean Architecture',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I write maintainable, scalable, and beautifully structured code.',
          style: TextStyle(fontSize: 18, color: textSecondary),
        ),
        const SizedBox(height: 40),
        GlassContainer(
          padding: EdgeInsets.zero,
          borderColor: glassBorder,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mac-style window header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: backgroundDark.withOpacity(0.5),
                  border: const Border(bottom: BorderSide(color: glassBorder)),
                ),
                child: Row(
                  children: [
                    _buildWindowControl(Colors.redAccent),
                    const SizedBox(width: 8),
                    _buildWindowControl(Colors.amber),
                    const SizedBox(width: 8),
                    _buildWindowControl(Colors.green),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Text(
                        'lib/presentation/home/home_page.dart',
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 13,
                          fontFamily: 'monospace',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              // Code Content
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(
                        text: 'class ',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      TextSpan(
                        text: 'HomePage ',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                      TextSpan(
                        text: 'extends ',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      TextSpan(
                        text: 'StatelessWidget ',
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                      TextSpan(text: '{\n', style: TextStyle(color: white)),

                      TextSpan(
                        text: '  const ',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      TextSpan(
                        text: 'HomePage',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      TextSpan(
                        text: '({super.key});\n\n',
                        style: TextStyle(color: white),
                      ),

                      TextSpan(
                        text: '  @override\n',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '  Widget ',
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                      TextSpan(
                        text: 'build',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      TextSpan(text: '(', style: TextStyle(color: white)),
                      TextSpan(
                        text: 'BuildContext ',
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                      TextSpan(
                        text: 'context) {\n',
                        style: TextStyle(color: white),
                      ),

                      TextSpan(
                        text: '    return ',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      TextSpan(
                        text: 'Scaffold',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                      TextSpan(text: '(\n', style: TextStyle(color: white)),

                      TextSpan(
                        text: '      backgroundColor',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                      TextSpan(text: ': ', style: TextStyle(color: white)),
                      TextSpan(
                        text: 'Theme',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                      TextSpan(text: '.', style: TextStyle(color: white)),
                      TextSpan(
                        text: 'of',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      TextSpan(
                        text: '(context).\n',
                        style: TextStyle(color: white),
                      ),
                      TextSpan(
                        text: '          colorScheme.background,\n',
                        style: TextStyle(color: white),
                      ),

                      TextSpan(
                        text: '      body',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                      TextSpan(text: ': ', style: TextStyle(color: white)),
                      TextSpan(
                        text: 'const ',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      TextSpan(
                        text: 'AnimatedPortfolio',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                      TextSpan(text: '(),\n', style: TextStyle(color: white)),
                      TextSpan(
                        text: '    );\n',
                        style: TextStyle(color: white),
                      ),
                      TextSpan(text: '  }\n', style: TextStyle(color: white)),
                      TextSpan(text: '}\n', style: TextStyle(color: white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWindowControl(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
