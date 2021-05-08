
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 900,
          width: 700,
          color: Colors.deepPurple,
          child: Container(
            
          height: 550,
          width: 900,
            child: Image.asset('assets/images/xo.gif',alignment:Alignment.center, fit:BoxFit.contain,height: 400,width: 400,)),
          // child: Image.asset('assets/images/xo.riv', fit: BoxFit.cover,),

      ),
    );
  }
}