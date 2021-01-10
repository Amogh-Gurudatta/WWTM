import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BlueTooth extends StatefulWidget {
  @override
  _BlueToothState createState() => _BlueToothState();
}

class _BlueToothState extends State<BlueTooth> {
  // Initializing the Bluetooth connection state to be unknown
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  // Get the instance of the Bluetooth
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // Track the Bluetooth connection with the remote device
  BluetoothConnection connection;

  // To track whether the device is still connected to Bluetooth
  bool get isConnected => connection != null && connection.isConnected;

  // Define a new class member variable for storing the devices list
  List<BluetoothDevice> _devicesList = [];

  // Define a member variable to track when the disconnection is in progress
  bool isDisconnecting = false;

  // Define this member variable for storing the current device connectivity status
  bool _connected = false;

  // Define this member variable for storing each device from the dropdown items
  BluetoothDevice _device;

  Future<void> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the Bluetooth is off, then turn it on first and then retrieve the devices that are paired.
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [_devicesList] for accessing the list outside this class
    setState(() {
      _devicesList = devices;
    });
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(
        DropdownMenuItem(
          child: Text(
            'NONE',
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(50, 50, 50, 0.79),
            ),
          ),
        ),
      );
    } else {
      _devicesList.forEach((device) {
        items.add(
          DropdownMenuItem(
            child: Text(
              device.name,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(50, 50, 50, 0.79),
              ),
            ),
            value: device,
          ),
        );
      });
    }
    return items;
  }

  void _connect() async {
    if (_device.toString() != 'WWTM') {
    } else {
      if (!isConnected) {
        await BluetoothConnection.toAddress(_device.address)
            .then((_connection) {
          connection = _connection;
          setState(() {
            _connected = true;
          });
        });
      }
    }
  }

  void _disconnect() async {
    await connection.close();
    if (!connection.isConnected) {
      setState(() {
        _connected = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    // If the Bluetooth of the device is not enabled, then request permission to turn on Bluetooth as the app starts up
    enableBluetooth();

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // For retrieving the paired devices list
        getPairedDevices();
      });
    });
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }
    super.dispose();
  }

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
              height: 83,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Enable Bluetooth',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromRGBO(50, 50, 50, 1),
                  ),
                ),
                SizedBox(
                  width: 109,
                ),
                Switch(
                  activeColor: Color.fromRGBO(105, 164, 178, 1),
                  activeTrackColor: Color.fromRGBO(105, 164, 178, 0.67),
                  inactiveThumbColor: Color.fromRGBO(242, 244, 251, 1),
                  inactiveTrackColor: Color.fromRGBO(196, 196, 196, 0.81),
                  value: _bluetoothState.isEnabled,
                  onChanged: (bool value) {
                    future() async {
                      if (value) {
                        // enable bluetooth
                        await FlutterBluetoothSerial.instance.requestEnable();
                      } else {
                        // disable bluetooth
                        await FlutterBluetoothSerial.instance.requestDisable();
                      }
                      // In order to update the devices list
                      await getPairedDevices();
                      if (_connected) {
                        _disconnect();
                      }
                    }

                    future().then((_) {
                      setState(() {});
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Tap on "WWTM" to connect',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(50, 50, 50, 0.79),
              ),
            ),
            DropdownButton(
              items: _getDeviceItems(),
              onChanged: (value) => setState(
                () => _device = value,
              ),
              value: _devicesList.isNotEmpty ? _device : null,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(105, 164, 178, 1),
              ),
              onPressed: () {
                _connect();
                Navigator.pushReplacementNamed(context, '/stats');
              },
              child: Text(
                'connect',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(50, 50, 50, 1),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              'If you cannot find the device in the list, pair the device in bluetooth setings.',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(50, 50, 50, 0.79),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
