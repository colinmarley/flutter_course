import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../models/device.dart';
import './scan_button.dart';
import './device_list.dart';

class ScanPage extends StatefulWidget {
  final btnTitle = 'Scan';

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final List<Device> _devices = [];

  void _scanForDevices() {
    print('Starting');
    FlutterBlue.instance
        .scan(
      timeout: Duration(seconds: 5),
    )
        .listen((scanResult) {
      var seen = false;
      for (var i = 0; i < _devices.length; i++) {
        if (_devices[i].id == scanResult.device.id.toString()) {
          seen = true;
          break;
        }
      }

      if (!seen) {
        _addNewDevice(
          scanResult.device.name,
          scanResult.device.id.toString(),
          scanResult.rssi.toString(),
          scanResult.device.state.toString(),
        );
      }
    }, onDone: () {
      print('Done');
    });
  }

  void _addNewDevice(String name, String id, String rssi, String status) {
    var newDevice = Device(
      name: name,
      id: id,
      rssi: rssi,
      status: status,
    );
    setState(() {
      _devices.add(newDevice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ScanButton(widget.btnTitle, _scanForDevices),
            Container(
              child: DeviceList(_devices),
              height: 400,
            ),
          ],
        );
  }
}
