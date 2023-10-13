// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:moneymanagement/widgets/bottomnavigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagement/widgets/splash_screen.dart';

import 'data/add_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}
