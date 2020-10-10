import 'dart:convert';

import 'package:bitcoin_ticker/models/ExchangeRate.dart';
import 'package:bitcoin_ticker/utils/secrets.dart';
import 'package:http/http.dart' as http;

String buildExchangeRateUrl(String fromCrypto, String toCurrency) {
  return 'https://rest.coinapi.io/v1/exchangerate/$fromCrypto/$toCurrency?apikey=$API_KEY';
}

Future<ExchangeRate> fetchExchangeRate(
    String fromCrypto, String toCurrency) async {
  http.Response response =
      await http.get(buildExchangeRateUrl(fromCrypto, toCurrency));
  if (response.statusCode == 200) {
    print('success');
    var jsonData = jsonDecode(response.body);
    return ExchangeRate.fromJson(jsonData);
  } else {
    print(response.statusCode);
    throw new Exception('Failed to fetch exchange rate.');
  }
}
