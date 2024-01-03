import 'dart:ui';

import 'package:fitgoapp/bmicalculator.dart';
import 'package:fitgoapp/dashboard/sets_reps.dart';
import 'package:fitgoapp/diteReviewer.dart';
import 'package:fitgoapp/exercisePages.dart';
// import 'package:fitgoapp/exercisepages/exercisePages.dart';
// import 'package:fitgoapp/exercises/sets_reps.dart';
import 'package:fitgoapp/tracker.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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
                    border: Border.all()
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
                    border: Border.all()
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
            SizedBox(
              height: 10,
            ),
            // ListTile(
            //   title: Text('Button 3'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => s()),
            //     );// Close the drawer
            //   },
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all()
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

