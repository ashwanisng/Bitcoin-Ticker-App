import 'package:bitcoin_ticker/services/network.dart';

class CoinData {
  Future<dynamic> getCurrency() async {
    NetworkHelper networkHelper = NetworkHelper();

    var usdRate = await networkHelper.getData();
    return usdRate;
  }
}
