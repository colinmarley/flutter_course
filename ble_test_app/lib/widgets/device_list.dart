import 'package:flutter/material.dart';

class DeviceList extends StatefulWidget {
  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  final _devices = <Widget>[];

  Widget _buildDeviceList() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext ctx, int ind) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          height: 70,
          child: Card(
            child: ListTile(
              title: Text('Device ${ind + 1} Name'),
              leading: Icon(Icons.bluetooth),
              trailing: RaisedButton(
                elevation: 5,
                child: Text('Connect'),
                onPressed: () {},
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDeviceList();
  }
}
