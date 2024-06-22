import 'package:flutter/material.dart';
import 'dart:async';

import '../../model/RegisterScreen.dart';
import '../../model/loginScreen.dart';
import '../LoginPatient/login_patient_guardian.dart';

// Import the necessary packages for Bloc


class SplashScreen extends StatefulWidget {
  static String routeName ='splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (_, __, ___) => RegisterScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
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
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.white,
          //     Colors.white,
          //   ],
          // ),
          color: Colors.white
        ),

        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('asset/images/splash.png', scale: 1,width: 300,),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}