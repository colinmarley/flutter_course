import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import './widgets/device_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  final _devices = [];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('BLE Test App'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text('Scan'),
              elevation: 5,
              onPressed: () {
                print('Starting');
                _flutterBlue
                    .scan(
                  timeout: Duration(seconds: 5),
                )
                    .listen((scanResult) {
                  var seen = false;
                  for (var i = 0; i < _devices.length; i++) {
                    if (_devices[i] == scanResult.device.id) {
                      seen = true;
                      break;
                    }
                  }

                  if (!seen) {
                    setState(() {
                      _devices.add(scanResult.device.id);
                    });
                  }

                  print(scanResult.device.id);
                }, onDone: () {
                  print('Done');
                  print(_devices);
                });
              },
            ),
            RaisedButton(
              child: Text('cancel'),
              onPressed: () {},
            ),
            Container(
              child: DeviceList(),
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
