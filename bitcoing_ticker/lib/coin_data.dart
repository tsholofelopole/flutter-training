import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {



  List<Text> createStringMenuItems() {
    List<Text> dropdownItems = [];
    for (String item in currenciesList) {
      dropdownItems.add(Text(item));
    }

    return dropdownItems;
  }

    List<DropdownMenuItem> createDropdownMenuItems() {
      List<DropdownMenuItem<String>> dropdownItems = [];
      for (String item in currenciesList) {
          dropdownItems.add(DropdownMenuItem(child: Text(item), value: item));
      }

      return dropdownItems;
    }
}
