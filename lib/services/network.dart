import 'dart:convert';

import 'package:http/http.dart' as http;

const String url = "https://rest.coinapi.io/v1/exchangerate";
const api_key = "268390E3-CD1E-46FC-B132-A5A2C402A9A2";

class NetworkHelper {
  Future getData(String selectedCountry) async {
    String requestUrl = "$url/BTC/$selectedCountry?apikey=$api_key";
    http.Response response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      double usdRate = data['rate'];
      return usdRate;
    } else {
      return response.statusCode;
    }
  }
}
