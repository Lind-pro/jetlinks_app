import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    print('profile init');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Profile Page'),
    );
  }
}
