import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:wordle/SquareModel.dart';

class Square extends StatefulWidget {
  final SquareModel squaremodel;
  final Function getCurrentRow;
  Square({required this.squaremodel, required this.getCurrentRow});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 2,
      )),
      margin: EdgeInsets.all(5),
      height: 50,
      width: 50,
      child: widget.squaremodel.isUsed
          ? Container(
            margin:  EdgeInsets.all(5),
              decoration: BoxDecoration(color: widget.squaremodel.color),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              child: Text(
                widget.squaremodel.alphabet,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          : Center(
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    height: 50,
                    width: 25,
                    child: TextField(
                      maxLength: 1,
                      textCapitalization: TextCapitalization.characters,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      decoration: InputDecoration(
                          border: InputBorder.none, counterText: ""),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      ], // Only numbers can be entered),
                      onChanged: (value) {
                        widget.getCurrentRow(value, widget.squaremodel.row,
                            widget.squaremodel.column);
                      },
                    ),
                  ),
                )),
          ),
    );
  }
}
