import 'package:flutter/material.dart';
import 'diteReviewer.dart';
import 'bmicalculator.dart';
// import '../../fitgo/lib/exercise/homepage.dart';
import 'exercises/homepage.dart';
import 'inputpage.dart'; // Import other necessary files

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    GridPage(), // Instance of homepage
    FoodNutritionPage(), // Instance of DiteReviewer page
    // SetsRepsPage(), // Instance of Sets and Reps page
    Bmi(title: ''), // Instance of BmiCalculator page
    HomePage(), // Instance of Profile page
  ];

  @override
  Widget build(BuildContext context) {
MaterialApp(
  theme: ThemeData(

    // primaryColor: Colors.black,
    primarySwatch: Colors.blue,

  ),
);
    return Scaffold(

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        // backgroundColor: Colors.green, // Change this color to the desired color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_sharp, color: Colors.black),
            label: 'Diet Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined, color: Colors.black),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Tracker',
          ),
        ],
      ),
    );
  }
}
