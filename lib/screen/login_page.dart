import 'dart:ffi';
import 'package:fake_store/utils/alert/toast_alert.dart';
import 'package:fake_store/utils/const/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var screenWidth = 0.0, screenHeight = 0.0;
  var value = 10.0;

  var mailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
      //padding: EdgeInsets.all(value * 2),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: -screenHeight / 2,
            child: Container(
              width: screenHeight,
              height: screenHeight,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
            ),
          ),
          Container(
            padding: EdgeInsets.all(value * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/splash_image.png",
                  width: screenWidth / 2,
                  //height: 200,
                ),
                Divider(
                  color: Colors.transparent,
                ),
                TextField(
                  controller: mailController,
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
                  controller: passwordController,
                  cursorColor: Colors.black,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: screenWidth / 3,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          sign_in();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Colors.yellow),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In'.toUpperCase(),
                              style: GoogleFonts.acme(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize().MEDIUM),
                              ),
                            ),
                            SizedBox(
                              width: value / 2,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void sign_in() {
    String mail = mailController.text;
    String password = passwordController.text;


    if(mail.isEmpty || password.isEmpty){

      var error;
      if(mail.isEmpty){
        error = "imput mail";
      }else{
        error = "imput password";
      }

      ToastAlert().errorToast(error);
    }else{
      ToastAlert().successToast("success");

    }
  }
}
