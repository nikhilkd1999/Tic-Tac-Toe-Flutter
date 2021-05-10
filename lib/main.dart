import 'package:tic_tac_toe/choosePlayer_screen.dart';
import 'package:tic_tac_toe/splash_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
// Restrict to vertical mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.red,
      ),
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: SplashScreen(),
        nextScreen: ChoosePlayerScreen(),
        // splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
