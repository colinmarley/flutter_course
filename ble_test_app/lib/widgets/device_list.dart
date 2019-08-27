import 'package:flutter/material.dart';

import '../models/device.dart';
import './device_card.dart';

class DeviceList extends StatefulWidget {
  final List<Device> devices;

  DeviceList(this.devices);
  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {

  Widget _buildDeviceList() {
    return ListView.builder(
      itemCount: widget.devices.length,
      itemBuilder: (BuildContext ctx, int ind) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          height: 70,
          child: DeviceCard(widget.devices[ind],),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDeviceList();
  }
}
