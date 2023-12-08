// import 'package:flutter/material.dart';
//
//
// class ExerciseApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Exercise Information',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ExerciseHomePage(),
//     );
//   }
// }
//
// class ExerciseHomePage extends StatefulWidget {
//   @override
//   _ExerciseHomePageState createState() => _ExerciseHomePageState();
// }
//
// class _ExerciseHomePageState extends State<ExerciseHomePage> {
//   final List<String> exercises = [
//     'Push-ups',
//     'Squats',
//     'Plank',
//     'Burpees',
//     'Lunges',
//     // Add more exercises as needed
//   ];
//
//   List<String> filteredExercises = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredExercises = exercises;
//   }
//
//   void filterExercises(String query) {
//     setState(() {
//       filteredExercises = exercises
//           .where((exercise) =>
//           exercise.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exercise Information'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) => filterExercises(value),
//               decoration: InputDecoration(
//                 labelText: 'Search Exercise',
//                 hintText: 'Enter exercise name...',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredExercises.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(filteredExercises[index]),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             ExerciseDetailPage(exercise: filteredExercises[index]),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ExerciseDetailPage extends StatelessWidget {
//   final String exercise;
//
//   const ExerciseDetailPage({Key? key, required this.exercise})
//       : super(key: key);
//
//   // This is a placeholder for exercise details. You can replace it with actual information.
//   String getExerciseDetails() {
//     // You can fetch details from an API or use hardcoded details here.
//     switch (exercise) {
//       case 'Push-ups':
//         return 'Push-ups are a great exercise for the upper body...';
//       case 'Squats':
//         return 'Squats are excellent for strengthening the lower body...';
//       case 'Plank':
//         return 'The plank is a core strengthening exercise...';
//       case 'Burpees':
//         return 'Burpees are a full-body exercise that works multiple muscle groups...';
//       case 'Lunges':
//         return 'Lunges are effective for building lower body strength...';
//     // Add more exercise details as needed
//       default:
//         return 'Exercise details not available';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(exercise),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text(
//           getExerciseDetails(),
//           style: TextStyle(fontSize: 18.0),
//         ),
//       ),
//     );
//   }
// }
