
// import 'package:fitgoapp/exercises/homepage.dart';
import 'package:fitgoapp/dashboard/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',

      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
