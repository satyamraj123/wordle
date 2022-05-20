import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wordle/GameModel.dart';
import 'package:wordle/HowToPlay.dart';
import 'package:wordle/SquareModel.dart';
import 'package:wordle/square.dart';
import 'package:wordle/wordleLogo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game game = new Game();
  int currentRow = 0;
  List<String> rowWord = ["", "", "", ""];
  @override
  void initState() {
    game.resetGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                WordleLogo(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, i) {
                        return Center(
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: ListView.builder(
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, j) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Square(
                                          squaremodel: game.getGrid()[i][j],
                                          getCurrentRow: getCurrentRow,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        );
                      }),
                ),
                game.getGameState() == 1
                    ? Text(
                        "CONGRATULATIONS YOU WON",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Container(),
                game.getGameState() == -1 ? Text1() : Container(),
                SizedBox(
                  height: 10,
                ),
                game.getGameState() != 0
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          currentRow = 0;
                          rowWord = ["", "", "", ""];
                          game.resetGame();
                          setState(() {});
                        },
                        child: Text("Reset"),
                      )
                    : Container(),
                game.getGameState() == 0
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: () {
                          if (game.modifyRow(rowWord, currentRow)) {
                            game.evaluateRow(rowWord, currentRow);
                            currentRow++;
                            rowWord = ["", "", "", ""];
                            setState(() {});
                          }
                        },
                        child: Text("Submit"))
                    : Container(),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => HowToPlay()));
                    },
                    child: Text("How to play?")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Text1() => Center(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'The correct word was '),
                  TextSpan(
                      text: game.currentPlayableWord.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Text(
              "Better luck next time!",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
  void getCurrentRow(String val, int row, int column) {
    rowWord[column] = val;
    setState(() {});
  }
}
