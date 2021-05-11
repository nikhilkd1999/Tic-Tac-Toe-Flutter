import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/getWinner.dart';
import './home_page_screen.dart';
import './minimax.dart';
import './lst.dart';

class ChoosePlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var boxLength = min(mediaQuery.size.width, mediaQuery.size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Opponent'),
        backgroundColor: themeGreen,
      ),
      body: Container(
        width: double.infinity,
        color: themeBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.all(10),
              height: boxLength * 0.2,
              width: boxLength * 0.8,
              child: InkWell(
                onTap: () {
                  isBotEnabled = true;
                  reset(LST);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return MyHomePage();
                      },
                    ),
                  );
                },
                splashColor: themeGreen,
                // borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "BOT",
                      style: TextStyle(
                        fontSize: boxLength * 0.3 * 0.3,
                        // color: themeYellow,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          themeGreen.withOpacity(0.7),
                          themeGreen,
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd),
                    // borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              // height: boxLength * 0.4,
              // width: boxLength * 0.4,
              height: boxLength * 0.2,
              width: boxLength * 0.8,
              // margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  isBotEnabled = false;
                  reset(LST);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return MyHomePage();
                      },
                    ),
                  );
                },
                splashColor: themeGreen,
                // borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "HUMAN",
                      style: TextStyle(
                        fontSize: boxLength * 0.3 * 0.3,
                        // color: themeOrange,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          themeGreen.withOpacity(0.7),
                          themeGreen,
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd),
                    // borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
