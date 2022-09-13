import 'dart:convert';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

import 'coin_data.dart';

String coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate/';
String apiKey = 'EBD171FA-A1F9-42BC-B8A8-78D1C1961210';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  int bitcoinValue = 0;
  CoinData coinData = CoinData();
  String selectedCurrency = 'USD';
  String activeCoinType = 'BTC';

  void getBitcoinCurrency() async {
    var url = '$coinApiUrl$activeCoinType\/$selectedCurrency?apikey=$apiKey';
    print('url: $url');
    http.Response response = await http.get(url);

    if(response.statusCode.clamp(200, 299) == response.statusCode) {
      dynamic decodedResponse = jsonDecode(response.body);
      double rate  = decodedResponse['rate'];
      bitcoinValue = rate.toInt();
    } else {
      print('InValid response received');
    }
  }

  DropdownButton getDropDownButton() {
    return DropdownButton<String> (
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getBitcoinCurrency();
          print(value);
        });
      },
      items: coinData.createDropdownMenuItems(),
    );
  }

  CupertinoPicker createCupertinoPicker() {
    return CupertinoPicker(
      itemExtent: 35.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: coinData.createStringMenuItems(),
    );
  }

  Widget getCurrencyPicker() {
    if (Platform.isAndroid) {
      return getDropDownButton();
    } else if (Platform.isIOS) {
      return createCupertinoPicker();
    }
  }

  List<Widget> createBitcoinItems() {
    List<BitCoinWidget> bitcoinWidgets = [];
    for(String coinType in cryptoList) {
      bitcoinWidgets.add(BitCoinWidget(bitcoinValue, selectedCurrency, coinType));

      setState(() {
        activeCoinType = coinType;
      });

    }

    return bitcoinWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createBitcoinItems(),
          ),

          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: getCurrencyPicker(),
          ),
        ],
      ),
    );
  }
}

class BitCoinWidget extends StatelessWidget {
   BitCoinWidget(this.bitcoinValue, this.selectedCurrency, this.currencyType) ;

  final int bitcoinValue;
  final String selectedCurrency;
  final String currencyType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $currencyType = ${bitcoinValue.toString()} $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
