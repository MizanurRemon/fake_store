import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/MyTextStyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var pageTitle;
  var value = 10.0;

  @override
  void initState() {
    // TODO: implement initState
    pageTitle = "Profile";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Icon(
        Icons.person,
        color: Colors.white,
      ),
      title: Text(pageTitle,
          style: GoogleFonts.lato(textStyle: MyTextStyle().appbarText())),
      backgroundColor: Colors.blueGrey,
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
