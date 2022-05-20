import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordle/SquareModel.dart';
import 'package:flutter/material.dart';
import 'package:wordle/data.dart';
import 'dart:math' as math;

class Game {
  String currentPlayableWord = "bake";
  //playableWords[math.Random().nextInt(100) % playableWords.length];
  List<List<SquareModel>> grid = [];
  int userlevel = 0;
  int gameState = 0;
//0 means playing
//1 means game won
//-1 means game lost
  Game() {
    resetGame();
    setuserlevel(0);
  }

  List<List<SquareModel>> getGrid() {
    return this.grid;
  }

  String getCurrentPlayableWord() {
    return this.currentPlayableWord;
  }

  void modifyGrid(int row, int col, String alphabet, Color color) {
    this.grid[row][col].alphabet = alphabet;
    this.grid[row][col].color = color;
    this.grid[row][col].isUsed = true;
  }

  int getGameState() {
    return this.gameState;
  }
void setuserlevel(int lev){
  this.userlevel=lev;
}
  void setGameState(int val) {
    this.gameState = val;
  }

  bool modifyRow(List<String> rowWord, int currentRow) {
    if (currentRow >= 6) {
      //game over
      return false;
    }
    if (rowWord.isEmpty || rowWord.contains("")) {
      print("enter all words");
      return false;
    }
    for (int i = 0; i < 4; i++) {
      if (currentPlayableWord[i].toLowerCase() == rowWord[i].toLowerCase()) {
        modifyGrid(currentRow, i, rowWord[i].toUpperCase(), Colors.green);
      } else if (currentPlayableWord
          .toLowerCase()
          .contains(rowWord[i].toLowerCase())) {
        modifyGrid(currentRow, i, rowWord[i].toUpperCase(), Color(0xffFFD700));
      } else {
        modifyGrid(currentRow, i, rowWord[i].toUpperCase(), Colors.grey);
      }
    }
    return true;
  }

  Future<void> evaluateRow(List<String> rowWord, int currentRow) async{
    if (currentRow >= 6) {
      setGameState(0);
      return;
    }
    for (int i = 0; i < 4; i++) {
      if (currentPlayableWord[i].toLowerCase() != rowWord[i].toLowerCase()) {
        setGameState(0);
        if (currentRow == 5) setGameState(-1);
        return;
      }
    }
    setGameState(1);
    setGridToUsed();
    await incrementUserLevel();
  }

  Future<void> incrementUserLevel() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('level', this.userlevel + 1);
    this.userlevel += 1;
  }

  void setGridToUsed() {
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 4; j++) {
        this.grid[i][j].isUsed = true;
      }
    }
  }

  int getUserLevel() {
    return this.userlevel;
  }

  Future<void> getUserLevelFromStore() async {
    final prefs = await SharedPreferences.getInstance();
    if (await prefs.containsKey('level')) {
         print("existing user");
      int lev = (await prefs.getInt('level'))!;
      print(lev);
      this.userlevel=lev;
    } else {
      print("new user");
      await prefs.setInt('level', 0);
      this.userlevel = 0;
    }
  }

  void resetGame() {
    setGameState(0);
    this.grid.clear();
    this.currentPlayableWord =
        playableWords[math.Random().nextInt(100) % playableWords.length];
    for (int i = 0; i < 6; i++) {
      List<SquareModel> temp = [];
      for (int j = 0; j < 4; j++) {
        temp.add(SquareModel(
            alphabet: "",
            color: Colors.white,
            isUsed: false,
            row: i,
            column: j));
      }
      this.grid.add(temp);
    }
  }
}
