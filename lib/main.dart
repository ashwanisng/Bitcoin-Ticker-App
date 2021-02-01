import 'package:bitcoin_ticker/screens/price_screen.dart';
import 'package:bitcoin_ticker/utilities/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kBlueBackgroundColor,
        scaffoldBackgroundColor: kWhiteTextColor,
      ),
      home: PriceScreen(),
    );
  }
}
