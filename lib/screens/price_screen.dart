import 'dart:ui';

import 'package:bitcoin_ticker/utilities/constant.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: kBlueBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
                child: Text(
                  '1 BTC = ? USD',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kWhiteTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            color: kBlueBackgroundColor,
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            child: DropdownButton(
              items: null,
              onChanged: (String value) {},
            ),
          )
        ],
      ),
    );
  }
}
