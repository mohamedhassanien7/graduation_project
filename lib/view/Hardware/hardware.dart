import 'package:flutter/material.dart';

class Hardware extends StatelessWidget {
  const Hardware({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child:Icon(Icons.bluetooth_disabled,
          size: 200.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
