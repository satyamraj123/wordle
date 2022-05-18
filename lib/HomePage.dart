import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wordle/GameModel.dart';
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WordleLogo(),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
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
                ),
                game.getGameState() == 1 ? Text("You Won") : Container(),
                game.getGameState() == -1 ? Text("You Lost") : Container(),
                game.getGameState() != 0
                    ? TextButton(
                        onPressed: () {
                          currentRow = 0;
                          rowWord = ["", "", "", ""];
                          game.resetGame();
                          setState(() {});
                        },
                        child: Text("Reset"))
                    : Container(),
                TextButton(
                    onPressed: () {
                      if (game.modifyRow(rowWord, currentRow)) {
                        game.evaluateRow(rowWord, currentRow);
                        currentRow++;
                        rowWord = ["", "", "", ""];
                        setState(() {});
                      }
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getCurrentRow(String val, int row, int column) {
    rowWord[column] = val;
    setState(() {});
  }
}
