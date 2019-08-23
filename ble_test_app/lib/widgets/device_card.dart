import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  // final String deviceName;
  // final String 


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 70,
      child: Card(
        child: ListTile(
          title: Text('Device 1 Name'),
          leading: Icon(Icons.bluetooth),
          trailing: RaisedButton(
            elevation: 5,
            child: Text('Connect'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
