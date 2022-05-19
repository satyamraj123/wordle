import 'package:flutter/material.dart';
import 'package:wordle/common.dart';

class HowToPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),
          Text1(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Each guess must be a valid five-letter word. Hit the enter button to submit.",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "After each guess, the color of the tiles will change to show how close your guess was to the word.",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Examples",
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 220,
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WordleBoxes("W", Colors.green),
                  WordleBoxes("E", Colors.black),
                  WordleBoxes("A", Colors.black),
                  WordleBoxes("R", Colors.black),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text2(),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 220,
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WordleBoxes("P", Colors.black),
                  WordleBoxes("I", Color(0xffFFD700)),
                  WordleBoxes("L", Colors.black),
                  WordleBoxes("L", Colors.black),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text3(),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 220,
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WordleBoxes("C", Colors.black),
                  WordleBoxes("A", Colors.black),
                  WordleBoxes("K", Colors.grey),
                  WordleBoxes("E", Colors.black),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text4(),
        ]),
      ),
    );
  }

  Widget Text1() => RichText(
        text: TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Guess the '),
            TextSpan(
                text: 'WORDLE',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' in six tries.'),
          ],
        ),
      );
  Widget Text2() => RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: 'The letter '),
            TextSpan(
                text: 'W', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' is in the word and in the correct spot.'),
          ],
        ),
      );
  Widget Text3() => RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: 'The letter '),
            TextSpan(
                text: 'I', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' is in the word but in the wrong spot.'),
          ],
        ),
      );
  Widget Text4() => RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: 'The letter '),
            TextSpan(
                text: 'K', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' is not in the word in any spot.'),
          ],
        ),
      );
}
