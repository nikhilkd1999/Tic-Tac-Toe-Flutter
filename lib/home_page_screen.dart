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
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(title: Text('XO'),
      ),
      body: Container(
      // color: winner=="" ? Colors.white : Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              Xchance ? "X's Turn" : "O's Turn",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height:
                isLandScape ? mediaQuery.size.height : mediaQuery.size.width,
            width: isLandScape ? mediaQuery.size.height : mediaQuery.size.width,

            // height: 400,
            // width: 400,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),

            child: GridView.count(
              crossAxisCount: 3,
              children: LST.asMap().entries.map((entry) {
                int ind = entry.key;
                // int n = Random();

                return Container(
                  margin: EdgeInsets.all(6),
                  // padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: colorWinner(ind)
                          ? Colors.red
                          : Colors.green, // background
                      // onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      if (LST[ind] != "") {
                        return;
                      }
                      setState(() {
                        LST[ind] = Xchance ? "X" : "O";
                        Xchance = !Xchance;
                        // countt=0;
                        if(isBotEnabled)
                        {
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
                          // colorWinner(winner);
                        }
                      });
                    },
                    child: LST[ind] == "Avni"
                        ? Text("")
                        : Text(
                            LST[ind],
                            style: TextStyle(fontSize: 30),
                          ),
                  ),
                );
              }).toList(),
            ),

            // child: LST.asMap().map((key, value) {}).toList(),
          ),
          if (winner != "")
            Text(
               winner=="Tie" ? "Tie" : "Winner is " + winner + " !!",
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