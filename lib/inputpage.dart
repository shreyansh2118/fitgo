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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('Track Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                  String name = nameController.text.trim();
                  double weight = double.tryParse(weightController.text.trim()) ?? 0;
                  double bmi = double.tryParse(bmiController.text.trim()) ?? 0;
                  double height = double.tryParse(heightController.text.trim()) ?? 0;
                  String dateString = dateController.text.trim();

                  if (name.isNotEmpty && dateString.isNotEmpty) {
                    DateTime selectedDate = DateTime.tryParse(dateString) ?? DateTime.now();
                    setState(() {
                      nameController.clear();
                      weightController.clear();
                      bmiController.clear();
                      heightController.clear();
                      userData.add(UserData(
                        name: name,
                        weight: weight,
                        bmi: bmi,
                        height: height,
                        dateTime: selectedDate,
                      ));
                      saveIntoSharedPreferences();
                    });
                  }
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 20),
              userData.isEmpty
                  ? const Text(
                'No Data yet..',
                style: TextStyle(fontSize: 22),
              )
                  : Expanded(
                child: ListView.builder(
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
                              nameController.text = userData[index].name;
                              weightController.text = userData[index].weight.toString();
                              bmiController.text = userData[index].bmi.toString();
                              heightController.text = userData[index].height.toString();
                              setState(() {
                                userData.removeAt(index);
                                saveIntoSharedPreferences();
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
