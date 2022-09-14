import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var screenWidth = 0.0, screenHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: buildBody(context),
      ),
      //backgroundColor: Colors.yellow,
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                height: screenWidth,
                //width: screenHeight,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  //border: Border.all(width: 1, color: Colors.red),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
