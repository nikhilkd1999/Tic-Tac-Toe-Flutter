
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
            /////////////////////////////////////////////////////////////////
            
    //         InkWell(
    //   onTap: () => selectCategory(context),
    //   splashColor: Theme.of(context).primaryColor,
    //   borderRadius: BorderRadius.circular(15),
    //   child: Container(
    //     padding: const EdgeInsets.all(10),
    //     // margin: const EdgeInsets.all(10),
    //     child: Text(
    //       "BOT",
    //       style: Theme.of(context).textTheme.title,
    //     ),
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //           colors: [
    //             color.withOpacity(0.7),
    //             color,
    //           ],
    //           begin: AlignmentDirectional.topStart,
    //           end: AlignmentDirectional.bottomEnd),
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //   ),
    // ),






            ],

            ),
              

          ],

        ),
      ),
    );
  }
}