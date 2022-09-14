import 'dart:async';

import 'package:fake_store/screen/root_page.dart';
import 'package:fake_store/utils/alert/toast_alert.dart';
import 'package:fake_store/utils/const/font_size.dart';
import 'package:flutter/material.dart';
import 'package:fake_store/sessions/session_manager.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var screenWidth, screenHeight;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        checkSession();
      },
    );
  }

  checkSession() async {
    final userID = await SessionManager().getUserID();
    //toast_alert.successToast(userID);
    //toast_alert.successToast("splash");
    if (userID != null) {
      //toast_alert.successToast(userID);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RootPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splash_image.png",
            width: screenWidth / 2,
            //height: 200,
          ),
          Divider(
            color: Colors.transparent,
          ),
          Text(
            "Fake Store",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: FontSize().LARGE * 2),
          ),
        ],
      ),
    );
  }
}
