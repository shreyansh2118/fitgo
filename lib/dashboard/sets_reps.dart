import 'dart:async';

import 'package:flutter/material.dart';

class repTimer extends StatefulWidget {
  @override
  _repTimerState createState() => _repTimerState();
}

class _repTimerState extends State<repTimer> {
  int sets = 0;
  int reps = 1;
  int currentTime = 0;
  bool isRunning = false;
  late Timer timer;

  void startTimer() {
    isRunning = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime++;
        if (currentTime == reps) {
          currentTime = 0;
          if (sets >= 1) {
            sets--;
          } else {
            stopTimer();
          }
        }
        if (sets == 0) {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    isRunning = false;
    timer.cancel();
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      currentTime = 0;
      sets = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Your Exercise'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sets: $sets',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Reps: $reps',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Time: $currentTime seconds',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sets++;
                    });
                  },
                  child: Text('Increase Sets'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (sets > 1) sets--;
                    });
                  },
                  child: Text('Decrease Sets'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      reps++;
                    });
                  },
                  child: Text('Increase Reps'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (reps > 1) reps--;
                    });
                  },
                  child: Text('Decrease Reps'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                  },
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
