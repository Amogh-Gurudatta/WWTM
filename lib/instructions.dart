import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'poppins',
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 79,
            ),
            Text(
              'Instructions',
              style: TextStyle(
                color: Color.fromRGBO(50, 50, 50, 1),
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Before installing or using the WWTM, please make sure your water filter is in an optimal condition. This helps the WWTM get the correct data, using which it will detect any fluctuations in the output water and notify you of them.',
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 0.75),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/blueTooth',
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              'next',
                              style: TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Color.fromRGBO(50, 50, 50, 1.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
