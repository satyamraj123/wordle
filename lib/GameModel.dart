import 'package:wordle/SquareModel.dart';
import 'package:flutter/material.dart';
import 'package:wordle/data.dart';
import 'dart:math' as math;

class Game {
  String currentPlayableWord =
      playableWords[math.Random().nextInt(100) % playableWords.length];
  List<List<SquareModel>> grid = [];

  Game() {
    resetGrid();
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

  void evaluateRow(String rowWord, int currentRow) {
    for (int i = 0; i < 4; i++) {
      if (currentPlayableWord[i] == rowWord[i]) {
        modifyGrid(currentRow, i, rowWord[i], Colors.green);
      } else if (currentPlayableWord.contains(rowWord[i])) {
        modifyGrid(currentRow, i, rowWord[i], Colors.yellow);
      } else {
        modifyGrid(currentRow, i, rowWord[i], Colors.grey);
      }
    }
  }

  void resetGrid() {
    for (int i = 0; i < 6; i++) {
      List<SquareModel> temp = [];
      for (int j = 0; j < 4; j++) {
        temp.add(SquareModel(alphabet: "", color: Colors.white, isUsed: false,row: i, column: j));
      }
      this.grid.add(temp);
    }
  }
}
