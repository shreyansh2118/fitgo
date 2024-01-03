// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// class SearchBar extends StatefulWidget {
//   final String searchTerm;
//
//   const SearchBar({required this.searchTerm});
//
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }
//
// class _SearchBarState extends State<SearchBar> {
//   List<Map<String, dynamic>> exercises = [];
//
//   Future<void> fetchExercises(String input) async {
//     String apiUrl = 'https://api.api-ninjas.com/v1/exercises?muscle=$input';
//
//     try {
//       var response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'X-Api-Key': 'ULUyTcBk1pbdR+ooV1OYJA==nn8aoD5BYM9V4vtk'
//         }, // Replace with your actual API key
//       );
//
//       if (response.statusCode == 200) {
//         // Parse JSON response
//         List<Map<String, dynamic>> data =
//         List<Map<String, dynamic>>.from(json.decode(response.body));
//
//         setState(() {
//           exercises = data;
//         });
//       } else {
//         print('Error: ${response.statusCode}');
//         print(response.body);
//         // Handle error if needed
//       }
//     } catch (e) {
//       print('Exception: $e');
//       // Handle exception
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchExercises(widget.searchTerm);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exercise List'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             for (var exercise in exercises)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       exercise['name'] ?? 'Exercise',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Type: ${exercise['type'] ?? ''}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Equipment: ${exercise['equipment'] ?? ''}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       exercise['instructions'] ?? '',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
