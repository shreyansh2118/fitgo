import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class User {
  final String date;
  final String height;
  final String weight;

  User(this.date, this.height,this.weight);

  //constructor that convert json to object instance
  User.fromJson(Map<String, dynamic> json) : date = json['date'],  height = json['height'],weight = json['weight'];

  //a method that convert object to json
  Map<String, dynamic> toJson() => {
    'date': date,
    'height': height,
    'weight':weight
  };
}

class Trackdata extends StatefulWidget {


  @override
  _TrackdataState createState() => _TrackdataState();
}
class _TrackdataState extends State<Trackdata> {
  late SharedPreferences sharedPreferences;

  TextEditingController _date = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();

  List<User> userList = []; // List to store User instances

  @override
  void initState() {
    super.initState();
    initialGetSaved();
  }

  void initialGetSaved() async {
    sharedPreferences = await SharedPreferences.getInstance();

    String? userDataString = sharedPreferences.getString('userdata');

    if (userDataString != null) {
      List<dynamic> decodedList = jsonDecode(userDataString);
      List<User> loadedList = decodedList.map((data) => User.fromJson(data)).toList();

      setState(() {
        userList = loadedList;
      });
    }
  }

  void storeUserData() {
    User user1 = User(_date.text, _height.text, _weight.text);
    userList.add(user1); // Add the new user to the list

    String encodedList = jsonEncode(userList.map((user) => user.toJson()).toList());
    sharedPreferences.setString('userdata', encodedList);
    setState(() {
      _date.text = ''; // Clear text fields after storing data
      _height.text = '';
      _weight.text = '';
    });
  }

  void clearData() {
    setState(() {
      userList = []; // Clear the list of stored users
      sharedPreferences.remove('userdata');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracker'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Track your fitness',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _date,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date(YYYY-MM-DD)',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _height,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter height',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _weight,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter weight',
                    ),
                  ),
                ),
              ),
              // Other TextFields remain unchanged
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          storeUserData();
                        },
                        child: Text('SAVE'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clearData();
                        },
                        child: Text('Clear saved data'),
                      ),
                    ],
                  ),
                ),
              ),

              // Display list of saved data
              Column(
                children: userList.map((user) {
                  return ListTile(
                    title: Text('Date: ${user.date}'),
                    subtitle: Text('Height: ${user.height}\nWeight: ${user.weight}'),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


