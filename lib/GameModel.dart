import 'package:wordle/SquareModel.dart';
import 'package:flutter/material.dart';
import 'package:wordle/data.dart';
import 'dart:math' as math;

class Game {
  String currentPlayableWord =
      playableWords[math.Random().nextInt(100) % playableWords.length];
  List<List<SquareModel>> grid = [
    [
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
    ],
    [
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
    ],
    [
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
    ],
    [
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
    ],
    [
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
    ],
    [
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
      SquareModel(alphabet: "", color: Colors.white, isUsed: false),
    ]
  ];

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
}
