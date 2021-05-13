import 'package:tic_tac_toe/choosePlayer_screen.dart';
import 'package:tic_tac_toe/home_page_screen.dart';
import 'package:tic_tac_toe/lst.dart';
import 'package:tic_tac_toe/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
      title: "Tic Tac",
      theme: ThemeData(
        primarySwatch: Colors.green,
        // primarySwatch: themeGreen,
        accentColor: Colors.red,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 1000,
        duration: 2000,
        splash: SplashScreen(),
        // splash: MyHomePage(),
        nextScreen: ChoosePlayerScreen(),
        // nextScreen: MyHomePage(),
        // splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: themeBlack,
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
