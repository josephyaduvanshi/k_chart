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
    high = json['high'] ?? 0.0;
    low = json['low'] ?? 0.0;
    close = json['close'] ?? 0.0;
    vol = json['vol'] ?? 0.0;
    amount = json['amount'] ?? 0.0;
    // int? tempTime = json['time']?.toInt();
    // //兼容火币数据
    // if (tempTime == null) {
    //   tempTime = json['id']?.toInt() ?? 0;
    //   tempTime = tempTime! * 1000;
    // }
    time = DateTime.parse(json['date']).millisecondsSinceEpoch;
    ratio = (json['close'] - json['open']) / json['open'];
    change = json['close'] - json['open'];
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
