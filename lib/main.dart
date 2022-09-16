import 'package:fake_store/screen/dashboard_page.dart';
import 'package:fake_store/screen/profile_page.dart';
import 'package:fake_store/screen/root_page.dart';
import 'package:fake_store/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(brightness: Brightness.dark),
      ),*/
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.blueGrey, statusBarBrightness: Brightness.dark),
      child: Scaffold(
        body: SafeArea(
          child: SplashPage(),
        ),
      ),
    );
  }
}
