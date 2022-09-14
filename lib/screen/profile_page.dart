import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blueGrey,
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.person),
      ),
    );
  }
}
