// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:moneymanagement/home.dart';
import 'package:moneymanagement/widgets/bottomnavigation.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottom()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 107, 103),
      body: Center(
        child: Text(
          'CASH FLOW',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
