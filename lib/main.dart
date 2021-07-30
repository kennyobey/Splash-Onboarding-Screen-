import 'package:flutter/material.dart';
import 'package:onboarding_ui/boarding_screen.dart';
import 'package:onboarding_ui/data/data.dart';
import 'package:onboarding_ui/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: MyHomePage(),
    );
  }
}

