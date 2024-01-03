import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';


// bicep page

class bicepPage extends StatefulWidget {
  @override
  _bicepPageState createState() => _bicepPageState();
}

class _bicepPageState extends State<bicepPage> {
  List<Map<String, dynamic>> exercises = [];

  Future<void> fetchExercises() async {
    String muscle = 'biceps';
    String apiUrl = 'https://api.api-ninjas.com/v1/exercises?muscle=$muscle';

    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-Api-Key': 'ULUyTcBk1pbdR+ooV1OYJA==nn8aoD5BYM9V4vtk'
        }, // Replace with your actual API key
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(json.decode(response.body));

        setState(() {
          exercises = data;
        });
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
        // Handle error if needed
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exception
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: exercises.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Lottie.asset(
                'assets/biceps.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            for (var exercise in exercises)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise['name'] ?? 'Exercise',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Type: ${exercise['type'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Equipment: ${exercise['equipment'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      exercise['instructions'] ?? '',
                      style: TextStyle(fontSize: 18,),
                    ),
                    Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}


// chest page


class chestPage extends StatefulWidget {
  @override
  _chestPageState createState() => _chestPageState();
}

class _chestPageState extends State<chestPage> {
  List<Map<String, dynamic>> exercises = [];

  Future<void> fetchExercises() async {
    String muscle = 'chest';
    String apiUrl = 'https://api.api-ninjas.com/v1/exercises?muscle=$muscle';

    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-Api-Key': 'ULUyTcBk1pbdR+ooV1OYJA==nn8aoD5BYM9V4vtk'
        }, // Replace with your actual API key
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.body));

        setState(() {
          exercises = data;
        });
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
        // Handle error if needed
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exception
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: exercises.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Lottie.asset(
                'assets/chest.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            for (var exercise in exercises)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise['name'] ?? 'Exercise',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Type: ${exercise['type'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Equipment: ${exercise['equipment'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      exercise['instructions'] ?? '',
                      style: TextStyle(fontSize: 18,),
                    ),
                    Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// hamstringsPage


class hamstringsPage extends StatefulWidget {
  @override
  _hamstringsState createState() => _hamstringsState();
}

class _hamstringsState extends State<hamstringsPage> {
  List<Map<String, dynamic>> exercises = [];

  Future<void> fetchExercises() async {
    String muscle = 'hamstrings';
    String apiUrl = 'https://api.api-ninjas.com/v1/exercises?muscle=$muscle';

    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-Api-Key': 'ULUyTcBk1pbdR+ooV1OYJA==nn8aoD5BYM9V4vtk'
        }, // Replace with your actual API key
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.body));

        setState(() {
          exercises = data;
        });
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
        // Handle error if needed
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exception
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: exercises.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Lottie.asset(
                'assets/squats.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            for (var exercise in exercises)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise['name'] ?? 'Exercise',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Type: ${exercise['type'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Equipment: ${exercise['equipment'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      exercise['instructions'] ?? '',
                      style: TextStyle(fontSize: 18,),
                    ),
                    Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// lats page


class latsPage extends StatefulWidget {
  @override
  _latsPageState createState() => _latsPageState();
}

class _latsPageState extends State<latsPage> {
  List<Map<String, dynamic>> exercises = [];

  Future<void> fetchExercises() async {
    String muscle = 'lats';
    String apiUrl = 'https://api.api-ninjas.com/v1/exercises?muscle=$muscle';

    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-Api-Key': 'ULUyTcBk1pbdR+ooV1OYJA==nn8aoD5BYM9V4vtk'
        }, // Replace with your actual API key
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.body));

        setState(() {
          exercises = data;
        });
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
        // Handle error if needed
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exception
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: exercises.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Lottie.asset(
                'assets/lats.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            for (var exercise in exercises)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise['name'] ?? 'Exercise',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Type: ${exercise['type'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Equipment: ${exercise['equipment'] ?? ''}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      exercise['instructions'] ?? '',
                      style: TextStyle(fontSize: 18,),
                    ),
                    Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}