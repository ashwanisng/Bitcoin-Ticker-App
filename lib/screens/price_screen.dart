import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/network.dart';
import 'package:bitcoin_ticker/utilities/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

String selectedCurrency = 'USD';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitcoinValueInUSD = "";
  @override
  void initState() {
    super.initState();
    getCurrencyRate();
  }

  void getCurrencyRate() async {
    try {
      double usdRates = await NetworkHelper().getData();
      setState(() {
        bitcoinValueInUSD = usdRates.toStringAsFixed(1);
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownMenuItem = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownMenuItem.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropDownMenuItem,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> picker = [];

    for (String currency in currenciesList) {
      var newItem = Text(currency);
      picker.add(newItem);
    }
    return CupertinoPicker(
      backgroundColor: kBlueBackgroundColor,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectIndex) {
        print(selectIndex);
      },
      children: picker,
    );
  }

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
                  '1 BTC = $bitcoinValueInUSD USD',
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
            child: Platform.isIOS ? iosPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}
