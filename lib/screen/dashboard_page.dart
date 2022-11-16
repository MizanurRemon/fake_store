import 'package:fake_store/Model/Product_response.dart';
import 'package:fake_store/Utils/API/ApiServices.dart';
import 'package:fake_store/Utils/const/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

    // ApiServices().getProducts();
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
      child: FutureBuilder<List<ProductResponse>>(
        future: ApiServices().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print("snapshot:: "+snapshot.data.toString());
            List<ProductResponse> products =
                snapshot.data as List<ProductResponse>;

            return GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(value),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.network(
                            products[index].image.toString(),
                            scale: .5,
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        /*RatingBar.builder(
                          initialRating: double.parse(products[index].rating!.rate.toString()),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding:
                          EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),*/
                        Text(
                          products[index].title.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: value/2,
                        ),
                        Row(
                          children: [
                            Text("Price: ${products[index].price.toString()}"),
                            const Spacer(),
                            Text("Rating: ${products[index].rating!.rate.toString()}"),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: products.length,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
                        Text(
                          "Dialog",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize().MEDIUM),
                        ),
                        const Spacer(),
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
