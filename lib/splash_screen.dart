import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          // width: double.infinity,

          // color: themeBlack,
          child: Image.asset(
            'assets/images/icon.png',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            // width: 200,
            // height: 900,
          ),
          // child: Image.asset('assets/images/xo.riv', fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
