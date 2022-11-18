import 'package:fake_store/Model/Product_details_response.dart';
import 'package:fake_store/Utils/API/ApiServices.dart';
import 'package:fake_store/Utils/alert/toast_alert.dart';
import 'package:fake_store/Utils/const/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/MyTextStyle.dart';

class ProductDetailsPage extends StatefulWidget {
  var id;

  ProductDetailsPage(this.id);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var id, pageTitle, value = 10.0;

  @override
  void initState() {
    id = widget.id;
    // TODO: implement initState
    pageTitle = "Product Details";
    ToastAlert().successToast(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      title: Text(pageTitle,
          style: GoogleFonts.lato(textStyle: MyTextStyle().appbarText())),
      backgroundColor: Colors.blueGrey,
    );
  }

  buildBody(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: ApiServices().getProductDetails(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ProductDetailsResponse response =
                  snapshot.data as ProductDetailsResponse;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.network(
                      response.image.toString(),
                      scale: .5,
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Container(
                    padding: EdgeInsets.all(value),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          response.title.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSize().SMALL,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        Row(
                          children: [
                            Text(
                              "Price: ${response.price.toString()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: FontSize().SMALL),
                            ),
                            Spacer(),
                            RatingBar.builder(
                              initialRating: double.parse(
                                  response.rating!.rate.toString()),
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Category: ${response.category.toString()}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: FontSize().SMALL),
                            ),
                            Spacer(),
                            Text(
                              "Vote: ${response.rating?.count.toString()}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: FontSize().SMALL),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        Text(
                          "${response.description.toString()}",
                          style: TextStyle(
                              color: Colors.black, fontSize: FontSize().SMALL),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
