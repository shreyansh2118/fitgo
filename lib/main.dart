import 'dart:async';

import 'package:fitgoapp/tasks.dart';
import 'package:flutter/material.dart';

// import '../../fitgoApp/lib/tasks.dart';

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      // theme: ThemeData(
      //
      //   primarySwatch: Colors.green,
      // ),
      home: Task(),
    );
  }
}