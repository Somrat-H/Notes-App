import 'package:flutter/material.dart';
import 'package:keep_notes/components/bottom_bar.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Color(Colors.black),
      // ),
      home: HomeScreen(),
    );
  }
}

