import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class Square extends StatefulWidget {
  final Color color;
  final String alphabet;
  final bool isUsed;
  Square({required this.alphabet, required this.color, required this.isUsed});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      padding: EdgeInsets.all(5),
      child: widget.isUsed
          ? Container(
              decoration: BoxDecoration(color: widget.color),
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                widget.alphabet,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )
          : Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: Container(
                width: 30,
                child: TextField(
                  maxLength: 1,
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  decoration: InputDecoration(
                      border: InputBorder.none, counterText: ""),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ], // Only numbers can be entered),
                ),
              )),
    );
  }
}
