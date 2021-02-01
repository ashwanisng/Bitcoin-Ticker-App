import 'package:bitcoin_ticker/utilities/constant.dart';
import 'package:flutter/material.dart';

class MakeCryptoCard extends StatelessWidget {
  const MakeCryptoCard(
      {this.cryptoCurrency, this.selectedCurrency, this.value});
  final String selectedCurrency;
  final String cryptoCurrency;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: kBlueBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            style: TextStyle(
              fontSize: 20.0,
              color: kWhiteTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
