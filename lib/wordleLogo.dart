import 'package:flutter/material.dart';

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
            WordleBoxes("W"),
            WordleBoxes("O"),
            WordleBoxes("R"),
            WordleBoxes("D"),
            WordleBoxes("L"),
            WordleBoxes("E"),
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

  Widget WordleBoxes(String text) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      height: 50,
      width: 50,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
