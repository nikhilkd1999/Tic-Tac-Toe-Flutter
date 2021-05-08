
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/getWinner.dart';
import './home_page_screen.dart';
import './minimax.dart';
import './lst.dart';




class ChoosePlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,

              children:[


            
            Container(
              // margin: EdgeInsets.all(10),
              height: mediaQuery.size.width*0.4,
              width: mediaQuery.size.width*0.4,
              child: InkWell(
                
      onTap: () {

        isBotEnabled = true;
                    reset(LST);

                  Navigator.of(context).push(MaterialPageRoute(builder: (_){

                    return MyHomePage();
                    },),);
        


      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            "BOT",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
                colors: [
                  Colors.green.withOpacity(0.7),
                  Colors.green,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
            ),



            Container(
              height: mediaQuery.size.width*0.4,
              width: mediaQuery.size.width*0.4,
              // margin: EdgeInsets.all(10),
              child: InkWell(
      onTap: () {

        isBotEnabled = false;
                    reset(LST);

                  Navigator.of(context).push(MaterialPageRoute(builder: (_){

                    return MyHomePage();
                    },),);
        


      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            "2 Player",
            style: Theme.of(context).textTheme.title,
            
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
                colors: [
                  Colors.green.withOpacity(0.7),
                  Colors.green,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
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