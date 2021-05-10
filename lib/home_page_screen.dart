import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import './getWinner.dart';
import './minimax.dart';
import './lst.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var boxLength = min(mediaQuery.size.width, mediaQuery.size.height);
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('XO'),
      ),
      body: Container(
        width: double.infinity,
        // color: winner=="" ? Colors.white : Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isBotEnabled)
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  getWinner(LST) == ""
                      ? (Xchance ? "X's Turn" : "O's Turn")
                      : "",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            Container(
              height: boxLength * 0.7,
              width: boxLength * 0.7,

              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),

              child: GridView.count(
                crossAxisCount: 3,
                children: LST.asMap().entries.map((entry) {
                  int ind = entry.key;
                  // int n = Random();

                  return Container(
                    // margin: EdgeInsets.all(10),
                    // height: boxLength*0.1,
                    // width: boxLength*0.1,
                    child: InkWell(
                      onTap: () {
                        if (LST[ind] != "") {
                          return;
                        }
                        setState(() {
                          LST[ind] = Xchance ? "X" : "O";
                          Xchance = !Xchance;
                          // countt=0;
                          if (isBotEnabled) {
                            bestMove(LST);
                          }
                          // print(countt);
                          winner = getWinner(LST);

                          if (winner != "") {
                            for (int i = 0; i < 9; ++i) {
                              if (LST[i] == "") {
                                LST[i] = "Avni";
                              }
                            }
                          }
                        });
                      },
                      splashColor: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        // margin: const EdgeInsets.all(10),
                        child: Center(
                          child: LST[ind] == "Avni"
                              ? Text("")
                              : Text(
                                  LST[ind],
                                  style: TextStyle(
                                    fontSize: boxLength * 0.3 * 0.5,
                                    color: Colors.black.withOpacity(0.9),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                (colorWinner(ind) ? Colors.red : Colors.green)
                                    .withOpacity(0.7),
                                (colorWinner(ind) ? Colors.red : Colors.green)
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // child: LST.asMap().map((key, value) {}).toList(),
            ),
            if (winner != "")
              Text(
                winner == "Tie" ? "Tie" : "Winner is " + winner + " !!",
                style: TextStyle(fontSize: 30),
              ),
            // if (winner == "")
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      reset(LST);
                    });
                  },
                  child: Text("Reset")),
            )
          ],
        ),
      ),
    );
  }
}
