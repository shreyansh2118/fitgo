
import 'package:fitgoapp/exercises/sets_reps.dart';
import 'package:flutter/material.dart';


class GridPage extends StatelessWidget {
  final List<String> images = [

    'assets/pushups.jpg',
    'assets/squat.jpg',
    'assets/plank.webp',
    'assets/Bicepcurl.jpg',
    'assets/yoga.webp',
    'assets/abs.webp',
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
                   child:  Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[index]),  // Use AssetImage to provide the asset path
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
                    )

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
class bicepspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Biceps curl'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bicep exercises are designed to target and strengthen the muscles in the upper arm region, specifically the biceps brachii, which is a prominent muscle in the front of the arm. Incorporating various bicep exercises into your workout routine can help enhance arm strength, aesthetics, and functionality.',
                style: TextStyle(
                  // letterSpacing: 4,
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.healthmates.com.au/wp-content/uploads/2013/08/Bicep-curl-690x400.jpg', // Replace with your image URL
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class plankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Plank'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The most common plank is the forearm plank which is held in a push-up-like position, with the body weight borne on forearms, elbows, and toes. Many variations exist such as the side plank and the reverse plank. The plank is commonly practiced in Pilates and yoga, and by those training for boxing and other sports.',
                style: TextStyle(
                  // letterSpacing: 4,
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold,
                ),

              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.livemint.com/img/2021/01/25/1140x641/iStock-628092382_1611576531363_1611576553196.jpg', // Replace with your image URL
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class pushUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Pushup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Push-up exercise is a close chain kinetic exercise which improves the joint proprioception, joint stability and muscle co-activation around the shoulder joint. Push-ups activate a large number of muscles together, increasing the demand on the heart muscle and the respiratory rate.',
                style: TextStyle(
                  // letterSpacing: 4,
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold,
                ),

              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.muscleandfitness.com/wp-content/uploads/2018/02/1109-feet-elevated-pushup.jpg?w=800&quality=86&strip=all', // Replace with your image URL
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class squatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Squat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Squats burn calories and might help you lose weight. They also lower your chances of injuring your knees and ankles. As you exercise, the movement strengthens your tendons, bones, and ligaments around the leg muscles. It takes some of the weight off your knees and ankles.',
                style: TextStyle(
                  // letterSpacing: 4,
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold,
                ),

              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://ryanspiteri.com/wp-content/uploads/squat.jpg', // Replace with your image URL
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class yogaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Squat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Yoga is a holistic discipline that originated in ancient India and has evolved into a diverse practice known for its physical, mental, and spiritual benefits. It combines physical postures (asanas), breathing techniques (pranayama), meditation, and philosophical principles to promote overall well-being.',
                style: TextStyle(
                  // letterSpacing: 4,
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold,
                ),

              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.healthshots.com/healthshots/en/uploads/2022/05/11184715/Yoga-for-weight-loss-770x436.jpg', // Replace with your image URL
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Abspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Abs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Abs exercises are crucial for developing and maintaining core strength. A strong core provides stability for various movements and activities, supporting your posture and reducing the risk of injuries. ',
                style: TextStyle(
                  // letterSpacing: 4,
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold,
                ),

              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://media.self.com/photos/5dfa77378873ee00093325ae/4:3/w_1920,c_limit/GettyImages-498282756.jpg', // Replace with your image URL
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}