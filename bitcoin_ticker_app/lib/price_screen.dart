import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io'  show Platform;

class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String currency = 'USD';

  CoinData coinData = CoinData();

  late String rate1 ='?';
  late String rate2 ='?';
  late String rate3 ='?';




  DropdownButton androidDropDown() {
    List<DropdownMenuItem<String>> currencyList = [];
    for (String currency in currenciesList) {
      var dropDownItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      currencyList.add(dropDownItem);
    }

    return DropdownButton(
        value: currency,
        items: currencyList,
        onChanged: (value) {
          setState(() {


            currency = value;
            rate1 = '?';
            rate2 = '?';
            rate3 = '?';
            updateUi(value);

          });
        },

      );

  }

  CupertinoPicker iosPicker(){

    List<Widget> currencyList = [];
    for (String currency in currenciesList) {
      var textWidget = Text(currency, style: TextStyle(color: Colors.white));
      currencyList.add(textWidget);
    }

    return  CupertinoPicker(

      backgroundColor: Colors.lightBlue,

      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {

        currency = currencyList[selectedIndex] as String;
        rate1 = '?';
        updateUi(currency);

      },
      children: currencyList,

    );
  }

  List<DropdownMenuItem<String>> returnCurrency() {
    List<DropdownMenuItem<String>> currencyList = [];
    for (String currency in currenciesList) {
      var dropDownItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      currencyList.add(dropDownItem);
    }
    return currencyList;
  }

  List<Widget> returnTheCurrency() {
    List<Widget> currencyList = [];
    for (String currency in currenciesList) {
      var textWidget = Text(currency, style: TextStyle(color: Colors.white));
      currencyList.add(textWidget);
    }
    return currencyList;
  }

  @override
  void initState() {
    super.initState();
    updateUi(currency);
  }

  void updateUi(String currency) async{

    double value;

    // this is my code but it lags a bit as it takes time to get amd set rate value

    dynamic data1 = await coinData.getCoinData(currency , 1);
    dynamic data2 = await coinData.getCoinData(currency , 2);
    dynamic data3 = await coinData.getCoinData(currency , 3);

    if(data1!=null){

      setState(() {
        // value = data1['rate'];

        rate1 = data1['rate'].toStringAsFixed(0);
        rate2 = data2['rate'].toStringAsFixed(0);
        rate3 = data3['rate'].toStringAsFixed(0);
      });

    }

        // rate = 23345.67;
        //
        // double cryptoRate = await coinData.getCoinData();
        // setState(() {
        //   rate =cryptoRate.toStringAsFixed(0) ;
        //
        // });


        // print(cryptoData['rate'];

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
            children: [

              Padding(
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
                      '${cryptoList[0]} = $rate1 $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
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
                      '${cryptoList[1]} = $rate2 $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
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
                      '${cryptoList[2]} = $rate3 $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              // Cupertino Widgets for Ios styling . Check out Documentation Cupertino Flutter.
              child: Platform.isIOS? iosPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}

// Material App Widgets for Android

// DropdownButton<String>(
// value: currency,
//
// items:
// returnCurrency(),
// // const [
// //
// //
// //
// //   DropdownMenuItem(
// //     child: Text('ERU'),
// //     value: 'ERU',
// //   ),
// //   DropdownMenuItem(
// //     child: Text('YEN'),
// //     value: 'YEN',
// //   ),
// // ],
// onChanged: (value) {
// setState((){
// currency = value!;
//
// });
//
// },
//
//
// ),