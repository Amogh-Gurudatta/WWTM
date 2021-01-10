import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'instructions.dart';
import 'stats.dart';
import 'bluetooth.dart';
import 'customer_care.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.pushReplacementNamed(context, '/stats');
    } else {
      prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'poppins',
      ),
      routes: {
        '/': (context) => Instructions(),
        '/stats': (context) => Stats(),
        '/blueTooth': (context) => BlueTooth(),
        '/cc': (context) => Cc(),
      },
    );
  }
}
