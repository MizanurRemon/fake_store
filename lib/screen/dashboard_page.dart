import 'package:fake_store/Utils/const/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/MyTextStyle.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var pageTitle;
  var value = 10.0;

  @override
  void initState() {
    // TODO: implement initState
    pageTitle = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(value),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showNewDialog(context);
          },
          child: Text("Dialog"),
        ),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Icon(
        Icons.home,
        color: Colors.white,
      ),
      title: Text(pageTitle,
          style: GoogleFonts.lato(textStyle: MyTextStyle().appbarText())),
      backgroundColor: Colors.blueGrey,
    );
  }

  showNewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: Container(
              //padding: EdgeInsets.all(value),
              margin: EdgeInsets.all(value * 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(value))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(value),
                    child: Row(
                      children: [
                        Text("Dialog"),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Close",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize().MEDIUM),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
