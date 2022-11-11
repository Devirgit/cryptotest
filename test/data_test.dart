import 'dart:math';

/*

          categoryUID: map['category_id'] as int,
          count: map['count'] * 1.0,
          price: map['price'] * 1.0,
          symbol: map['symbol'] as String,
          uid: map['id'] as int,
          updateDate: DateTime.parse(map['update_date']).toLocal(),
          operationType: _typeOperation(map['type'] as int),
*/

double _randomCP() {
  final rng = Random();
  final int1 = rng.nextInt(1000);
  final int2 = rng.nextInt(7) + 1;
  return double.parse((int1 / int2).toStringAsFixed(2));
}

String _randomSymb() {
  List<String> symbols = ['DOT', 'BTC', 'MATIC', 'ETH'];
  final rng = Random();
  final int1 = rng.nextInt(4);
  return symbols[int1];
}

int _randomType() {
  final rng = Random();
  final int1 = rng.nextInt(2);
  return int1;
}

DateTime _randomDate() {
  final rng = Random();
  final month = rng.nextInt(11);
  final day = rng.nextInt(11);
  return DateTime(2022, month, day);
}

void generate() {
  Map<int, Map<String, dynamic>> data = {};
  int category = 1;
  for (int i = 0; i < 25; i++) {
    if (i == 20) {
      category = 2;
    }

    final stock = {
      'category_id': category,
      'count': _randomCP(),
      'price': _randomCP(),
      'symbols': _randomSymb(),
      'id': i,
      'update_date': _randomDate(),
      'type': _randomType()
    };
    data[i] = stock;
  }
  //print(data);
//  final json = jsonEncode(data as Map<String, dynamic>);
//  print(json);
}

void main() async {
  //final stoc = StockRepositoryImpl(stockService: TestStockService());
  //
  //final rres = await stoc.getStockCategory(-1);
  // final aad = TestStockService();

  //print(await aad.getStockCategory(1));
}
