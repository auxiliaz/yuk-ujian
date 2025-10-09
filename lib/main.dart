import 'package:flutter/material.dart';
import 'package:yuk_ujian/login_screen.dart';
import 'package:yuk_ujian/splash_screen.dart';
import './list_ujian.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YukUjian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
    home: LoginScreen(),
    );
  }
}
