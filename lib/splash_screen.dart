import 'dart:async';
import 'package:desal_pro/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:home_page.dart'; // Mengimport file home_page.dart

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false; // State untuk mengontrol animasi loading
  Timer? _timer;

  get color => null; // Timer untuk mengatur animasi

  @override
  void initState() {
    super.initState();
    // Setelah 4 detik, navigasi ke HomePage
    _timer = Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    // Memulai animasi loading setelah 0.5 detik
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = true;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Mematikan timer saat widget di dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C2366), // Warna latar belakang biru (#0095CF)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/Logo.png', // Path ke logo.png
                width: 270, // Sesuaikan lebar logo
                height: 270, // Sesuaikan tinggi logo
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading) // Tampilkan animasi loading jika _isLoading true
              AnimatedWaveLoading(),
          ],
        ),
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
