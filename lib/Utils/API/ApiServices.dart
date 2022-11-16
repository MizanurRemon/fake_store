import 'package:dio/dio.dart';
import 'package:fake_store/Model/Product_response.dart';

import '../URL/Urls.dart';

var dio = Dio();

class ApiServices {
  Future<List<ProductResponse>> getProducts() async {
    final response = await dio.get("${Urls().BASE_URL}${Urls().PRODUCTS}");

    print("statuscode:: " + response.statusCode.toString());
    //print("products:: " + response.data.toString());
    if (response.statusCode == 200) {
      List jsonResponse = response.data;
      //print("products:: " + response.data.toString());
      return jsonResponse.map((data) => ProductResponse.fromJson(data)).toList();
      //final List<dynamic> data = response.data;
      //return data.map((dynamic e) => ProductResponse.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load from API');
    }
  }
}
