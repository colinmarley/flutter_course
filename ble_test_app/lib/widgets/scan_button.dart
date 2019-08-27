import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  final String btnTitle;
  final Function onScan;

  ScanButton(this.btnTitle, this.onScan);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(btnTitle),
      elevation: 5,
      onPressed: () => onScan(),
    );
  }
}
