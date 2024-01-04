import 'package:firebase_core/firebase_core.dart';
import 'package:fitgoapp/dashboard/homepage.dart';
import 'package:fitgoapp/login/login.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyCHRiuX83SQzKWdLEl0hJg28aJvXHOBySg',
    appId: '1:880974617161:android:cfbf80a430eaa3ba1afd98',
    messagingSenderId: '880974617161',
    projectId: 'hostel-c538d',
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter auth Demo',
      home: Login(),
    );
  }
}
