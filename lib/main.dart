import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gradient_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GradientSplashScreen(),
    );
  }
}
