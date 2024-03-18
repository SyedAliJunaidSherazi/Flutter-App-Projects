 import 'package:http/http.dart' as http;
import 'dart:convert';
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

const apiKey = 'A6062F09-A21B-4B31-9453-DB550F3D0BAE';
const cryptoUrl = 'https://rest.coinapi.io/v1/exchangerate';
// add ?=apikey and then basit api key

class CoinData {

  CoinData();

  // String? currency;

  Future getCoinData(String currencyToBeConverted , int num) async{
    //
    String currencyToConvert = '';

    if(num==1){
      currencyToConvert = cryptoList[0];
    }else if(num==2){
      currencyToConvert = cryptoList[1];
    }else if(num==3){
      currencyToConvert = cryptoList[2];
    }

    // print(currency);
    // print(currencyToConvert);
    http.Response  response  = await http.get(Uri.parse('$cryptoUrl/$currencyToConvert/$currencyToBeConverted?apikey=$apiKey'));
    // print(response.statusCode);
    if(response.statusCode==200){

      String data = response.body;
      // var rate = jsonDecode(data)['rate'];
      // print(rate);

      // var rate =  jsonDecode(data)['rate'];
      // return rate;

      return jsonDecode(data); // this my own trick

    }else{

      print(response.statusCode);
    }



  }







}