import 'networking.dart';

class Price {
  Future<List> getPrice(String fiat) async {
    List result = [];

    // String url =
    //     'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC,&tsyms=$fiat&api_key=f76786d6471554c81a04cb2f2cb894e0974178647475a63ae9784594efcb553c,';

    String urlBTC =
        'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=$fiat';

    final networkHelperBTC = NetworkHelper(urlBTC);

    var dataCurr = await networkHelperBTC.getData();

    result.add(dataCurr[fiat]);

    String urlETH =
        'https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=$fiat';

    final networkHelperETH = NetworkHelper(urlETH);

    dataCurr = await networkHelperETH.getData();

    result.add(dataCurr[fiat]);

    String urlLTC =
        'https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=$fiat';

    final networkHelperLTC = NetworkHelper(urlLTC);

    dataCurr = await networkHelperLTC.getData();

    result.add(dataCurr[fiat]);

    // for (var i in dataCurr) {
    //   print(i);
    // }
    print(result);

    return result;

    // for (var i in dataCurr) {
    //   print(i);
    // }
  }
}
//  String rateString = f.format(11222221112.345);
//     print(rateString.runtimeType);


// print(dataCurr);
    // if (dataCurr != null) {
    //   setState(() {
    //     var rateE = dataCurr['rate'].toStringAsFixed(0);
    //     print(rateE.runtimeType);
    //     print(rateE);
    //   });
    // }