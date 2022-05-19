import 'package:flutter/material.dart';
import 'package:wordle/common.dart';

class WordleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            WordleBoxes("W",Colors.green),
            WordleBoxes("O",Colors.green),
            WordleBoxes("R",Colors.green),
            WordleBoxes("D",Colors.green),
            WordleBoxes("L",Colors.green),
            WordleBoxes("E",Colors.green),
          ]),
          Text(
            "A DAILY WORD GAME",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

 
}
