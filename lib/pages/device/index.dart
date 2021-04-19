import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  DevicePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  void initState() {
    super.initState();
    print('device init');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Device Page'),
    );
  }
}
