import 'dart:async';

import 'package:flutter/material.dart';
import 'package:name_storage/home_page.dart';
import 'package:name_storage/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 173, 228),
      body: Center(
          child: Icon(
        Icons.play_circle_filled_outlined,
        color: Colors.purple,
        size: 80,
      )),
    );
  }
}
