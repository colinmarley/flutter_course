import 'package:flutter/material.dart';

import '../models/device.dart';

class DeviceCard extends StatelessWidget {
  final Device device;

  DeviceCard(this.device);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 70,
      child: Card(
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text('name: ${device.name}'),
              Text('id: ${device.id}'),
            ],
          ),
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
