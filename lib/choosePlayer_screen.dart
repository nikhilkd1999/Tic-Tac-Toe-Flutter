
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/getWinner.dart';
import './home_page_screen.dart';
import './minimax.dart';
import './lst.dart';




class ChoosePlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Player'),
      ),
      body: Container(

        width: double.infinity,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          

          children: [



              

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children:[

              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  
                  child: Text('Play With Bot'),


                  onPressed: (){

                    isBotEnabled = true;
                    reset(LST);

                  Navigator.of(context).push(MaterialPageRoute(builder: (_){

                  return MyHomePage();

                  },
                  ),
                  );


                  },
                  
                  
                  ),
              ),

            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                
                child: Text('2 Player'),


                onPressed: (){

                  isBotEnabled = false;
                  reset(LST);

                Navigator.of(context).push(MaterialPageRoute(builder: (_){

                  return MyHomePage();

                    },
                  ),
                );


                },
                
                
                ),
            ),

            ],

            ),
              

          ],

        ),
      ),
    );
  }
}