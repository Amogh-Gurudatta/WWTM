import 'package:flutter/material.dart';

class Cc extends StatefulWidget {
  @override
  _CcState createState() => _CcState();
}

class _CcState extends State<Cc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'poppins',
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Text(
                'Customer Care Contact',
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Livpure',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'https://www.livpure.com/water-purifier',
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 0.75),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Blue Star',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'https://consumer.bluestarindia.com/',
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 0.75),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Kent',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('https://www.kent.co.in/water-purifiers/',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Eureka Forbes',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('https://www.eurekaforbes.com/water-purifiers',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Pureit',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                        'https://www.pureitwater.com/IN/pureit-water-purifiers',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Havells',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                        'https://www.havells.com/en/consumer/water-purifier.html',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Faber',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('http://faberindiawater.com/',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'AO Smith',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                        'https://www.aosmithindia.com/buy-water-purifiers-online',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tata',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('https://tataswach.com/',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'LG',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('https://www.lg.com/in/water-purifiers',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hindware',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 164, 178, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('https://www.hindwareappliances.com/water-purifiers/',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 0.75),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
