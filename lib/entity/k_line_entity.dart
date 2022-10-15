import '../entity/k_entity.dart';

class KLineEntity extends KEntity {
  late double open;
  late double high;
  late double low;
  late double close;
  late double vol;
  late double? amount;
  double? change;
  double? ratio;
  int? time;

  KLineEntity.fromCustom({
    this.amount,
    required this.open,
    required this.close,
    this.change,
    this.ratio,
    required this.time,
    required this.high,
    required this.low,
    required this.vol,
  });

  KLineEntity.fromJson(Map<String, dynamic> json) {
    open = json['open'] ?? 0.0;
    high = double.parse(json['high'].toString() == "null"
            ? "0"
            : json['high'].toString().isEmpty
                ? "0"
                : json['high'].toString())
        .toDouble();
    low = double.parse(json['low'].toString() == "null"
            ? "0"
            : json['low'].toString().isEmpty
                ? "0"
                : json['low'].toString())
        .toDouble();
    close = double.parse(json['close'].toString() == "null"
            ? "0"
            : json['close'].toString().isEmpty
                ? "0"
                : json['close'].toString())
        .toDouble();
    vol = double.parse(json['vol'].toString() == "null"
            ? "0"
            : json['vol'].toString().isEmpty
                ? "0"
                : json['vol'].toString())
        .toDouble();
    amount = double.parse(json['amount'].toString() == "null"
            ? "0"
            : json['amount'].toString().isEmpty
                ? "0"
                : json['amount'].toString())
        .toDouble();
    // int? tempTime = json['time']?.toInt();
    // //兼容火币数据
    // if (tempTime == null) {
    //   tempTime = json['id']?.toInt() ?? 0;
    //   tempTime = tempTime! * 1000;
    // }
    time = DateTime.parse(json['date']).millisecondsSinceEpoch;
    ratio = double.parse(json['high'].toString() == "null"
            ? "0"
            : json['ratio'].toString().isEmpty
                ? "0"
                : json['ratio'].toString())
        .toDouble();
    change = double.parse(json['open'].toString() == "null"
                ? "0"
                : json['open'].toString().isEmpty
                    ? "0"
                    : json['open'].toString())
            .toDouble() -
        double.parse(json['close'].toString() == "null"
                ? "0"
                : json['close'].toString().isEmpty
                    ? "0"
                    : json['close'].toString())
            .toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['open'] = this.open;
    data['close'] = this.close;
    data['high'] = this.high;
    data['low'] = this.low;
    data['vol'] = this.vol;
    data['amount'] = this.amount;
    data['ratio'] = this.ratio;
    data['change'] = this.change;
    return data;
  }

  @override
  String toString() {
    return 'MarketModel{open: $open, high: $high, low: $low, close: $close, vol: $vol, time: $time, amount: $amount, ratio: $ratio, change: $change}';
  }
}
