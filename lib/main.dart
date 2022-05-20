import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wordle/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child:HomePage(),
      builder: (context,child){
        return MaterialApp(
        title: 'Wordle',
        debugShowCheckedModeBanner: false,
        home: child,
      );
      },
    );
  }
}
