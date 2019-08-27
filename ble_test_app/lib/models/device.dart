import 'package:flutter/material.dart';

class Device {
  final String name;
  final String id;
  final String rssi;
  final String status;

  Device({
    @required this.name,
    @required this.id,
    @required this.rssi,
    @required this.status,
  });
}