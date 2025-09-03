import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/screens/home_screen.dart';

class GradientSplashScreen extends StatefulWidget {
  @override
  _GradientSplashScreenState createState() => _GradientSplashScreenState();
}

class _GradientSplashScreenState extends State<GradientSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Fade in
    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Movimiento vertical desde un poco debajo del centro hasta el centro con rebote
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2), // 0.2 → un poco abajo
      end: Offset(0, 0), // 0 → centro
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _controller.forward();

    // Navegar a HomeScreen después de 3 segundos
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                width: screenHeight * 0.55,
                height: screenHeight * 0.55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
