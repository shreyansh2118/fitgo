import 'dart:ui';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgoapp/login/authentication.dart';
import 'package:fitgoapp/login/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:fitgoapp/bmicalculator.dart';
import 'package:fitgoapp/dashboard/sets_reps.dart';
import 'package:fitgoapp/diteReviewer.dart';
import 'package:fitgoapp/exercisePages.dart';
// import 'package:fitgoapp/dashboard/SearchBar.dart';
import 'package:fitgoapp/tracker.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  final String name;
  Dashboard({Key? key, required this.name}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> _handleSignOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
    } catch (error) {
      print("Error during sign-out: $error");
      // Handle error - display a snackbar or show an error dialog to the user
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => repTimer()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.fitness_center_sharp,color: Colors.white,),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://steelsupplements.com/cdn/shop/articles/shutterstock_1662145102_1000x.jpg?v=1632334259',
                  fit: BoxFit.cover,
                  color: Color(0x3A393988),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(200.0),
                child:   Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          // filled: true,
                          // fillColor: Colors.grey,
                          hintText: 'Enter body part name',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          String searchTerm = _searchController.text;
                          if (searchTerm.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchBar( searchTerm: searchTerm),
                              ),
                            );
                          }
                        },
                        child: Text('Search'),
                      ),
                    ],
                  ),
                ),
              ),
              // actions: [
              //
              // ],
              floating: true,
              pinned: true,
              snap: false,
              title: Text(
                "FitGo",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              toolbarHeight: 80,
            ),

          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Trends",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 16),
                _buildCard("assets/Bicepcurl.jpg", "Bicep", bicepPage()),
                SizedBox(height: 16),
                _buildCard("assets/pushups.jpg", "Chest", chestPage()),
                SizedBox(height: 16),
                _buildCard("assets/squat.jpg", "Hamstrings", hamstringsPage()),
                SizedBox(height: 16),
                _buildCard("assets/lats.webp", "Lats", latsPage()),
                SizedBox(height: 16),


              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    'Welcome ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('${widget.name}')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                decoration: BoxDecoration(
                    border: Border.all( color: Colors.white70)
                ),
                child: ListTile(
                  title: Text('BMI', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Bmi(
                                title: '',
                              )),
                    ); // Close the drawer
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all( color: Colors.white70)
                ),
                child: ListTile(
                  title: Text('Dite revewier', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodNutritionPage()),
                    ); // Close the drawer
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         border: Border.all()
            //     ),
            //     child: ListTile(
            //       title: Text('Dite revewier', style: TextStyle(
            //           fontSize: 22, fontWeight: FontWeight.w600),),
            //       onTap: () {
            //         _handleSignOut();
            //         // Close the drawer
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(

                    border: Border.all(
                      color: Colors.white70
                    )
                ),
                child: ListTile(
                  title: Text('Tracker', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Trackdata()),
                    ); // Close the drawer
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all( color: Colors.white70)
                ),
                child: ListTile(
                  title: Text('SignOut', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),),
                  onTap: () {
                    AuthenticationHelper()
                        .signOut()
                        .then((_) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (contex) => Login()),
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget _buildCard(String imageUrl, String text, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Search bar

class SearchBar extends StatefulWidget {
  final String searchTerm;

  const SearchBar({required this.searchTerm});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<Map<String, dynamic>> exercises = [];

  Future<void> fetchExercises(String input) async {
    String apiUrl = 'https://api.api-ninjas.com/v1/exercises?muscle=$input';

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
    fetchExercises(widget.searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      style: TextStyle(
                        fontSize: 18,
                      ),
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
