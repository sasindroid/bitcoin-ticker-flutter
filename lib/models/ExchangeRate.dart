// "time": "2020-10-10T19:23:57.2597440Z",
// "asset_id_base": "BTC",
// "asset_id_quote": "USD",
// "rate": 11369.059069480080876923188661
class ExchangeRate {
  final String time;
  final String from;
  final String to;
  final double rate;

  ExchangeRate({this.time, this.from, this.to, this.rate});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      time: json['time'],
      from: json['asset_id_base'],
      to: json['asset_id_quote'],
      rate: json['rate'],
    );
  }
}
