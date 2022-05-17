import 'package:flutter/material.dart';
import 'package:wordle/SquareModel.dart';
import 'package:wordle/square.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: [
          Row(children: [Square(
            alphabet: "A",
            color: Colors.blue,
            isUsed: true,
          ),
          Square(
            alphabet: "A",
            color: Colors.blue,
            isUsed: false,
          )],),
          
        ],
      ),
    );
  }
}
