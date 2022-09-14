import 'package:flutter/material.dart';
import 'package:fake_store/screen/profile_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';


import 'dashboard_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var screenWidth = 0.0, screenHeight = 0.0;

  int _selectedIndex = 0;

  List<Widget> tabItems = [DashboardPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: buildBody(context),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        iconSize: 20,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.blueGrey,
        animationCurve: Curves.linear,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      width: screenWidth,
      color: Colors.yellow,
      child: tabItems[_selectedIndex],
    );
  }
}
