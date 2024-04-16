import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/mapSample');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/image/splashLogo.png')),
    );
  }
}
