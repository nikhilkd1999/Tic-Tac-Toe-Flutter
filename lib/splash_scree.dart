import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 900,
        color: Colors.deepPurple,
        child: Container(
            child: Image.asset(
          'assets/images/xo.gif',
          alignment: Alignment.center,
          fit: BoxFit.contain,
        )),
        // child: Image.asset('assets/images/xo.riv', fit: BoxFit.cover,),
      ),
    );
  }
}
