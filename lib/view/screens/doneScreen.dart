import 'package:care_brecelet/model/loginScreen.dart';
import 'package:flutter/material.dart';

class doneScreen extends StatefulWidget {
  static const String routeName = 'done';

  @override
  State<doneScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<doneScreen> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('asset/images/done.jpg',fit: BoxFit.fill,);
  }

  goToHome() async {
    await Future.delayed(
        Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
            context, loginScreen.routeName, (route) => false));
  }
}