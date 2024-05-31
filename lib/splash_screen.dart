import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:desal_pro/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  bool _showLogo = false;
  Timer? _timer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    )..repeat();

    _timer = Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _showLogo = true;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = true;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C2366),
      body: Stack(
        children: [
          AnimatedBackground(controller: _controller),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _showLogo ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/Logo.png',
                      width: 270,
                      height: 270,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (_isLoading)
                  AnimatedOpacity(
                    opacity: _isLoading ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: AnimatedWaveLoading(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedWaveLoading extends StatefulWidget {
  @override
  _AnimatedWaveLoadingState createState() => _AnimatedWaveLoadingState();
}

class _AnimatedWaveLoadingState extends State<AnimatedWaveLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildWave(0),
        _buildWave(1),
        _buildWave(2),
      ],
    );
  }

  Widget _buildWave(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 0.5).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              (0.33 * index),
              (0.33 * index) + 0.33,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedBackground extends StatelessWidget {
  final AnimationController controller;

  AnimatedBackground({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: GeometryPainter(controller.value),
          child: Container(),
        );
      },
    );
  }
}

class GeometryPainter extends CustomPainter {
  final double animationValue;

  GeometryPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final double circleRadius = 50;
    final double rectSize = 40;
    final double offsetValue = sin(animationValue * 2 * pi) * 20;

    // Draw circles
    canvas.drawCircle(
      Offset(size.width * 0.2 + offsetValue, size.height * 0.3),
      circleRadius,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.8 - offsetValue, size.height * 0.7),
      circleRadius,
      paint,
    );

    // Draw rectangles
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5 + offsetValue),
        width: rectSize,
        height: rectSize,
      ),
      paint,
    );

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.3, size.height * 0.8 - offsetValue),
        width: rectSize,
        height: rectSize,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
