import 'dart:convert';

import 'package:bitcoin_ticker/utilities/coin_data.dart';
import 'package:http/http.dart' as http;

const String url = "https://rest.coinapi.io/v1/exchangerate";
const api_key = "268390E3-CD1E-46FC-B132-A5A2C402A9A2";

class NetworkHelper {
  Future getData(String selectedCountry) async {
    Map<String, String> cryptoPrice = {};

    for (String crypto in cryptoList) {
      String requestUrl = "$url/$crypto/$selectedCountry?apikey=$api_key";
      http.Response response = await http.get(requestUrl);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double lastPrice = data['rate'];
        cryptoPrice[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        return response.statusCode;
        // ignore: dead_code
        throw 'Problem to request url';
      }
    }
    return cryptoPrice;
  }
}
