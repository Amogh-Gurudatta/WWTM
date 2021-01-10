import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:push_notification/push_notification.dart';
import 'bluetooth.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';

class WaterWasted {
  double ml;
  DateTime id;
  WaterWasted({
    this.ml,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ml': ml,
    };
  }
}

void main() async {
  final database = openDatabase(
    join(
      await getDatabasesPath(),
      'wasted_database.db',
    ),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE wasted(id DATETIME, ml DOUBLE)",
      );
    },
    version: 1,
  );

  Future<void> insertWaterWasted(WaterWasted waterWasted) async {
    final Database db = await database;
    await db.insert(
      'wasted',
      waterWasted.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  Notificator notification;
  String _bodyText =
      'WWTM has detected additional water wasted today. Please get your purifier checked.';
  String notificationKey = 'key';

  @override
  void initState() {
    super.initState();
    notification = Notificator(
      onNotificationTapCallback: null,
    );
      ..requestPermissions(
        requestSoundPermission: true,
        requestAlertPermission: true,
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'poppins',
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: <Widget>[
                  Text(
                    'WWTM',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 36,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(50, 50, 50, 1),
                    ),
                  ),
                  Text(
                    'Water Wastage Tracking Meter',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(50, 50, 50, 0.79),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(21),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Weekly Stats',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(50, 50, 50, 0.79),
                          ),
                        ),
                        LineChart(
                          width: 340,
                          height: 200,
                          linePaint: null,
                          data: [],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WWTM',
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        fontSize: 36,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Water Wastage Tracking Meter',
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 0.79),
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/instructions',
                  );
                },
                child: Text(
                  'Instructions',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 248, 236, 1),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Color.fromRGBO(105, 164, 178, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(105, 164, 178, 1),
          elevation: 4,
          child: Icon(
            Icons.contact_support,
            color: Color.fromRGBO(252, 248, 236, 1),
          ),
          onPressed: () => Navigator.pushNamed(context, '/cc'),
        ),
      ),
    );
  }
}
