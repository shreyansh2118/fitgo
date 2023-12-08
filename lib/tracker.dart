import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  String name;
  double weight;
  double bmi;
  double height;
  DateTime dateTime;

  UserData({
    required this.name,
    required this.weight,
    required this.bmi,
    required this.height,
    required this.dateTime,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      weight: json['weight'].toDouble(),
      bmi: json['bmi'].toDouble(),
      height: json['height'].toDouble(),
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weight': weight,
      'bmi': bmi,
      'height': height,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}

class Trackdata extends StatefulWidget {
  const Trackdata ({Key? key}) : super(key: key);

  @override
  State<Trackdata > createState() => _TrackdataState();
}

class _TrackdataState extends State<Trackdata > {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<UserData> userData = [];

  late SharedPreferences sp;

  @override
  void initState() {
    getSharedPreferences();
    super.initState();
  }

  getSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    readFromSharedPreferences();
  }

  saveIntoSharedPreferences() {
    List<String> userDataString =
    userData.map((data) => jsonEncode(data.toJson())).toList();
    sp.setStringList('userData', userDataString);
  }

  readFromSharedPreferences() {
    List<String>? userDataString = sp.getStringList('userData');
    if (userDataString != null) {
      userData = userDataString
          .map((data) => UserData.fromJson(json.decode(data)))
          .toList();
    }
    setState(() {});
  }

  // @override
  // ... (Previous code remains unchanged)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  hintText: 'Date (YYYY-MM-DD)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Weight (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: bmiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'BMI',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Height (cm)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // ... (Previous onPressed logic remains unchanged)
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 20),
              userData.isEmpty
                  ? const Text(
                'No Data yet..',
                style: TextStyle(fontSize: 22),
              )
                  : ListView.builder(
                shrinkWrap: true,
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userData[index].name),
                    subtitle: Text(
                      'Weight: ${userData[index].weight}, BMI: ${userData[index].bmi}, Height: ${userData[index].height}, Date: ${userData[index].dateTime}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              userData.removeAt(index);
                              saveIntoSharedPreferences();
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            // ... (Previous onPressed logic remains unchanged)
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
