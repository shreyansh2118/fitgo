
import 'package:fitgoapp/exercises/sets_reps.dart';
import 'package:flutter/material.dart';

import '../exercise Pages.dart';

class GridPage extends StatelessWidget {
  final List<String> images = [
    'https://www.realsimple.com/thmb/rEmEAm4vfx67IRbFgoVA0RzhTgI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg', // Replace with your image URL
    'https://ryanspiteri.com/wp-content/uploads/leg-workout-.jpg', // Replace with your image URL
    'https://images.livemint.com/img/2021/01/25/1140x641/iStock-628092382_1611576531363_1611576553196.jpg', // Replace with your image URL
    'https://www.healthmates.com.au/wp-content/uploads/2013/08/Bicep-curl-690x400.jpg', // Replace with your image URL
    'https://images.healthshots.com/healthshots/en/uploads/2022/05/11184715/Yoga-for-weight-loss-770x436.jpg', // Replace with your image URL
    'https://media.self.com/photos/5dfa77378873ee00093325ae/4:3/w_1920,c_limit/GettyImages-498282756.jpg', // Replace with your image URL
  ];

  final List<String> texts = [
    'Push-up ',
    'Squat',
    'Plank',
    'Biceps curl',
    'Yoga',
    'Abs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FitGo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Action based on grid item index when tapped

                    switch (index) {
                      case 0:
                      // Action for the first grid item
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pushUpPage()),
                        );
                        break;
                      case 1:
                      // Action for the second grid item
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => squatPage()),
                        );
                        break;
                      case 2:
                      // Action for the second grid item
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => plankPage()),
                        );
                        break;
                      case 3:
                      // Action for the second grid item
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bicepspage()),
                        );
                        break;
                      case 4:
                      // Action for the second grid item
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => yogaPage()),
                        );
                        break;
                      case 5:
                      // Action for the second grid item
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Abspage()),
                        );
                        break;
                    // Add cases for other grid items as needed
                      default:
                        break;
                    }

                    // Example navigation to repTimer screen for each grid item

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        texts[index],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing as needed
          ElevatedButton(
            onPressed: () {
              // Navigate to repTimer screen when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => repTimer()),
              );
            },
            child: Text('Start Your Exercise'),
          ),
        ],
      ),
    );
  }
}
