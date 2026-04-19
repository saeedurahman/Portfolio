import 'dart:math';
import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> particles = [];
  final int maxParticles = 50;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    for (int i = 0; i < maxParticles; i++) {
      particles.add(Particle(random));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Shift gradient colors slowly based on controller value
        final color1 =
            Color.lerp(
              backgroundDark,
              backgroundPurple.withValues(alpha: 0.5),
              _controller.value,
            )!;
        final color2 =
            Color.lerp(
              backgroundPurple.withValues(alpha: 0.5),
              backgroundDark,
              _controller.value,
            )!;

        for (var p in particles) {
          p.update();
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CustomPaint(
            painter: ParticlePainter(particles, _controller.value),
            size: Size.infinite,
          ),
        );
      },
    );
  }
}

class Particle {
  double x;
  double y;
  double speedX;
  double speedY;
  double radius;
  double alpha;

  Particle(Random random)
    : x = random.nextDouble(),
      y = random.nextDouble(),
      speedX = (random.nextDouble() - 0.5) * 0.002,
      speedY = (random.nextDouble() - 0.5) * 0.002,
      radius = random.nextDouble() * 3 + 1,
      alpha = random.nextDouble() * 0.5 + 0.1;

  void update() {
    x += speedX;
    y += speedY;

    if (x < 0) x = 1.0;
    if (x > 1) x = 0.0;
    if (y < 0) y = 1.0;
    if (y > 1) y = 0.0;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = accentCyan
          ..style = PaintingStyle.fill;

    for (var p in particles) {
      paint.color = accentCyan.withValues(alpha: p.alpha);
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
