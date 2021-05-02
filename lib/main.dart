import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('XO'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LST = List<String>.filled(9, "", growable: false);
  bool Xchance = true;
  String winner = "";
  int xx = -1, yy = -1, zz = -1;

  bool colorWinner(int n) {
    if (n == xx || n == yy || n == zz) {
      return true;
    }
    return false;
  }

  void getWinnerColored(int x, int y, int z) {
    xx = x;
    yy = y;
    zz = z;
  }

  String getWinner() {
    int i;
    for (i = 0; i < 7; i += 3) {
      if (LST[i] == LST[i + 1] && LST[i] == LST[i + 2] && LST[i] != "") {
        getWinnerColored(i, i + 1, i + 2);
        return LST[i];
      }
    }

    for (i = 0; i < 3; ++i) {
      if (LST[i] == LST[i + 3] && LST[i] == LST[i + 6] && LST[i] != "") {
        getWinnerColored(i, i + 3, i + 6);
        return LST[i];
      }
    }

    if (LST[0] == LST[4] && LST[4] == LST[8] && LST[0] != "") {
      getWinnerColored(0, 4, 8);
      return LST[0];
    }
    if (LST[2] == LST[4] && LST[4] == LST[6] && LST[2] != "") {
      getWinnerColored(2, 4, 6);
      return LST[2];
    }

    for (i = 0; i < 9; ++i) {
      if (LST[i] == "") {
        break;
      }
    }
    if (i == 9) {
      getWinnerColored(-1, -1, -1);
      return "Tie";
    }
    getWinnerColored(-1, -1, -1);

    return "";
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    return Container(
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
                        winner = getWinner();

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
              "Winner is " + winner + " !!",
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
                  for (int i = 0; i < 9; ++i) {
                    LST[i] = "";
                  }
                  getWinnerColored(-1, -1, -1);
                  setState(() {
                    winner = "";
                    Xchance = true;
                  });
                },
                child: Text("Reset")),
          )
        ],
      ),
    );
  }
}