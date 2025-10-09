import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'welcome_screen.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _bgColor = Color(0xFF191265); // biru
  String _svgPath = 'assets/yukujian_white.svg'; // default logo untuk background biru

  @override
  void initState() {
    super.initState();

    // Ganti background & SVG setelah 1.5 detik
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _bgColor = Color(0xFFEDF1F6);
        _svgPath = 'assets/yukujian_blue.svg'; // logo versi biru untuk background putih
      });
    });

    // Setelah 3 detik, pindah ke HomeScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: _bgColor,
        width: double.infinity,
        child: Center(
          child: SvgPicture.asset(
            _svgPath,
            width: 300,
            height: 100,
          ),
        ),
      ),
    );
  }
}
