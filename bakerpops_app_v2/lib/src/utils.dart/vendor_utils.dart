import 'package:bakerpops_app_v2/src/widgets/bakers.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/featured_products.dart';
import '../models/bakers.dart';

class GetPopularVendors {
  Future<List<FeatureProducts>> getPopularVendors() async {
    var url = Uri.http('13.232.64.117', '/vendor/paid', {'q': '{http}'});
    // Await the http get response, then decode the json-formatted response.
    Response res = await get(url);
    if (res.statusCode == 200) {
      // print('Request passed with status: ${res.statusCode}.');
      // print(res.statusCode);
      // print(jsonDecode(res.body));
      // print(category_id);
      var body = jsonDecode(res.body);
      // print(body['categories'].runtimeType);
      // print('Printing Body');
      List<dynamic> listVendors = body['vendors'];
      try {
        List<FeatureProducts> vendors = listVendors
            .map(
              (dynamic item) => FeatureProducts.fromJson(item),
            )
            .toList();
        return vendors;
      } on Exception catch (e) {
        print(e);
        throw "Unable to retrieve bakers.";
      }
    } else {
      //print('Request failed with status: ${res.statusCode}.');
      throw "Unable to retrieve bakers.";
    }
  }
}

class GetVendors {
  Future<List<Bakers>> getVendors() async {
    var url = Uri.http('13.232.64.117', '/vendor/', {'q': '{http}'});
    // Await the http get response, then decode the json-formatted response.
    Response res = await get(url);
    if (res.statusCode == 200) {
      // print('Request passed with status: ${res.statusCode}.');
      // print(res.statusCode);
      // print(jsonDecode(res.body));
      // print(category_id);
      var body = jsonDecode(res.body);
      // print(body['categories'].runtimeType);
      // print('Printing Body');
      List<dynamic> listVendors = body['vendors'];
      try {
        List<Bakers> vendors = listVendors
            .map(
              (dynamic item) => Bakers.fromJson(item),
            )
            .toList();
        return vendors;
      } on Exception catch (e) {
        print(e);
        throw "Unable to retrieve bakers.";
      }
    } else {
      //print('Request failed with status: ${res.statusCode}.');
      throw "Unable to retrieve bakers.";
    }
  }
}
