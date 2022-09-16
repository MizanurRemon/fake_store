import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var screenWidth = 0.0, screenHeight = 0.0;
  var value = 10.0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: buildBody(context),
      ),
      //backgroundColor: Colors.yellow,
    );
  }

  buildBody(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      //color: Colors.transparent,
      padding: EdgeInsets.all(value * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'Mail',
              prefixIcon: Icon(Icons.mail_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.transparent,
          ),
          TextField(
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'Password',
              prefixIcon: const Icon(Icons.key),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Container(
            width: screenWidth,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: const Text('Sign In'),
            ),
          )
        ],
      ),
    );
  }
}
