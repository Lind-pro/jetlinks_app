import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  AlarmPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlarmPage();
}

class _AlarmPage extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
    print('alarm init');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Alarm Page'),
    );
  }
}
