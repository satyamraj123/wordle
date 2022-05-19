 import 'package:flutter/material.dart';
 
 
 Widget WordleBoxes(String text, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
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