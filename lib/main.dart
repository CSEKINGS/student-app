import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/common/login.dart';
import 'package:student_app/common/onboarding_screen.dart';
import 'package:student_app/common/process_data.dart';

String initScreen;
int onboard = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboard = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  initScreen = prefs.getString('username');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'student',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: route(),
    );
  }
}

Widget route() {
  if (onboard == 0 || onboard == null) {
    return OnBoardingPage();
  } else if (initScreen == '' || initScreen == null) {
    return LoginPage();
  } else {
    return ProcessData(initScreen);
  }
}
