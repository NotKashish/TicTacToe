//TODO: 23 Import Material
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/decoration.dart';
import 'package:tic_tac_toe/widgets/named_button.dart';

//TODO: 24 create a Game Screen
//TODO: 46 Convert to stateful widget
class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  //TODO 40 Create variable currentPlayer, moves, gameStatus, tiles
  String currentPlayer = 'X';

  int moves = 0;

  String gameStatus = 'playing';

  List<String> tiles = [
    'notPlayed',
    'notPlayed',
    'notPlayed',
    'notPlayed',
    'notPlayed',
    'notPlayed',
    'notPlayed',
    'notPlayed',
    'notPlayed',
  ];

  //TODO 41: Implement Game Logic
  void onTap(int index) {
    if(tiles[index] != 'notPlayed') {
      return;
    } else {
      moves += 1;
      tiles[index] = currentPlayer;
      print(index);
      print(tiles[index]);
      checkGameEnd();
      if(gameStatus != 'playing') {
        reset();
      } else {
        // if(currentPlayer == 'X') {
        //   currentPlayer = 'O';
        // } else {
        //   currentPlayer = 'X';
        // }
        //              Condition        If True  else
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }
    //TODO: 47 Add SetState
    setState(() {

    });
  }

  //TODO 42: Implement Game check logic
  void checkGameEnd() {
    if(moves == 9) {
      gameStatus = 'The game has been tied';
    } else if ((tiles[0] == currentPlayer && tiles[1] == currentPlayer && tiles[2] == currentPlayer) ||
        (tiles[3] == currentPlayer && tiles[4] == currentPlayer && tiles[5] == currentPlayer) ||
        (tiles[6] == currentPlayer && tiles[7] == currentPlayer && tiles[8] == currentPlayer) ||
        (tiles[0] == currentPlayer && tiles[3] == currentPlayer && tiles[6] == currentPlayer) ||
        (tiles[1] == currentPlayer && tiles[4] == currentPlayer && tiles[7] == currentPlayer) ||
        (tiles[2] == currentPlayer && tiles[5] == currentPlayer && tiles[8] == currentPlayer) ||
        (tiles[0] == currentPlayer && tiles[4] == currentPlayer && tiles[8] == currentPlayer) ||
        (tiles[2] == currentPlayer && tiles[4] == currentPlayer && tiles[6] == currentPlayer)
    ) {
      gameStatus = '$currentPlayer + has won the game!!!';
    }
  }

  //TODO 43: Implement reset
  void reset() {
    tiles = [
      'notPlayed',
      'notPlayed',
      'notPlayed',
      'notPlayed',
      'notPlayed',
      'notPlayed',
      'notPlayed',
      'notPlayed',
      'notPlayed',
    ];
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    moves = 0;
    gameStatus = 'playing';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 28 Add Scaffold background color from constants file
      backgroundColor: scaffoldBackgroundColor,
      //TODO: 29 Add an AppBar
      appBar: AppBar(
        //TODO: 30 Modify the App bar
        //TODO: 31 Create a new constant for App Bar color
        backgroundColor: appBarBackgroundColor,
        title: Text(
          'Tic Tac Toe',
          style: commonTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            //TODO: 35 Give the Row a Padding of 20
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    //TODO: 34 Add 3 Expanded widgets with container as Child
                    children: [
                      Expanded(
                        //TODO: 44 Wrap with Inkwell
                        child: InkWell(
                          onTap: () => onTap(0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: gridBorder,
                                bottom: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            //TODO: 39 Try using SVG
                            //TODO: 45 write Logic to display blank, Cross or Circle
                            child: tiles[0] == 'notPlayed' ? Container() : Center(
                              child: tiles[0] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(1),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: gridBorder,
                                bottom: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[1] == 'notPlayed' ? Container() : Center(
                              child: tiles[1] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(2),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[2] == 'notPlayed' ? Container() : Center(
                              child: tiles[2] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(3),
                          child: Container(
                            //TODO: 36 Give Container Border decoration
                            decoration: BoxDecoration(
                              border: Border(
                                right: gridBorder,
                                bottom: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[3] == 'notPlayed' ? Container() : Center(
                              child: tiles[3] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(4),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: gridBorder,
                                bottom: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[4] == 'notPlayed' ? Container() : Center(
                              child: tiles[4] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(5),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[5] == 'notPlayed' ? Container() : Center(
                              child: tiles[5] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(6),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[6] == 'notPlayed' ? Container() : Center(
                              child: tiles[6] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(7),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: gridBorder,
                              ),
                            ),
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[7] == 'notPlayed' ? Container() : Center(
                              child: tiles[7] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => onTap(8),
                          child: Container(
                            height: (MediaQuery.of(context).size.width - 40) / 3,
                            child: tiles[8] == 'notPlayed' ? Container() : Center(
                              child: tiles[8] == 'X' ? SvgPicture.asset('assets/vector_graphics/cross.svg')
                                  : SvgPicture.asset('assets/vector_graphics/circle.svg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //TODO 51: Add a named button to reset the game
          NamedButton(name: 'Reset Game', onTap: () => reset()),
        ],
      ),
    );
  }
}
