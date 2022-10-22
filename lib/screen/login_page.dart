import 'package:fake_store/Utils/Transaction/MyTransaction.dart';
import 'package:fake_store/screen/root_page.dart';
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
            padding: EdgeInsets.only(top: value * 2, left: value, right: value),
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
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      //showNewDialog(context);
                      MyTransaction(context: context).push(RootPage());
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
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
          )
        ],
      ),
    );
  }


}

/*Column(
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
      )*/
