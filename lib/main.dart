import 'package:flutter/material.dart';
import 'package:radio/radio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RadioPlayer(), // Launches the radio player
    );
  }
}