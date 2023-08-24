import 'networking.dart';

class TestPrice {
  void getPriceBulk() async {
    String urlBTC =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,EUR,IDR';

    final networkHelperBTC = NetworkHelper(urlBTC);

    var dataCurr = await networkHelperBTC.getData();

    // print(dataCurr[''])
  }
}
