//TODO: 2 Import Material Library
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/decoration.dart';
import 'package:tic_tac_toe/screens/game.dart';

import '../widgets/named_button.dart';

//TODO: 3 Create a new stateless widget called NewGame
class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: 6 Replace Container with a Scaffold
    return Scaffold(
      //TODO: 7 Give scaffold background color of ff4a433c
      //TODO: 26 Convert Scaffold Background color to a constant
      backgroundColor: scaffoldBackgroundColor,
      //TODO: 10 Wrap Container with Center widget
      //TODO: 14 Wrap Center widget in a column
      body: Column(
        //TODO: 15 change Main Axis Alignment to center
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO: 16 Create a new assets folder
          //TODO: 18 Add an Image widget
          //TODO: 19 give it a width of screen width / 2
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          //TODO: 20 Add a sized box
          SizedBox(
            height: MediaQuery.of(context).size.width / 7,
          ),
          Center(
            //TODO: 8 Add a container
            //TODO: 48 Extract the button to a NamedButton widget
            child: NamedButton(
              name: 'New Game',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Game(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: 12 Add box decoration like rounded corner and color a59c94
//TODO: 13 Give Container Padding Property
//TODO: 21 Give it same width as image
//TODO: 9 Give Container a child Text widget
//TODO: 22 Wrap in Inkwell Widget
//TODO: 25 Navigate to Game Screen
//TODO: 11 Stylize the text widget using style property
//TODO: 32 Convert the text style to constant decoration and replace it with that

//TODO 49 Add 2 parameters for the Named Button, name and onTap
//TODO 50 Move the NamedButton to a new file inside a widgets folder

