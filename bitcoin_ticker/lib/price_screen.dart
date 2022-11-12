import 'package:bitcoin_ticker/services/Price.dart';
import 'package:bitcoin_ticker/services/networking.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedCurrencyShow = 'USD';
  String rateBTC = "noData";
  String rateETH = "noData";
  String rateLTC = "noData";
  var f = NumberFormat("#,###.0#", "en_US");

  List<Widget> getPickerItems() {
    List<Widget> pickerItems = [];

    for (var i in currenciesList) {
      String currency = i;

      var newItem = Text(currency);
      pickerItems.add(newItem);
    }
    return pickerItems;
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (var i in currenciesList) {
      String currency = i;

      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $rateBTC $selectedCurrencyShow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $rateETH $selectedCurrencyShow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $rateLTC $selectedCurrencyShow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 220.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: CupertinoPicker(
                backgroundColor: Colors.lightBlueAccent,
                itemExtent: 32.0,
                onSelectedItemChanged: ((selectedIndex) async {
                  final price = Price();

                  print(selectedIndex);
                  selectedCurrency = currenciesList[selectedIndex];

                  var price_rate = await price.getPrice(selectedCurrency);

                  print('price_rate $price_rate');

                  if (price_rate != null) {
                    setState(() {
                      selectedCurrencyShow = selectedCurrency;

                      rateBTC = f.format(price_rate[0]);
                      rateETH = f.format(price_rate[1]);
                      rateLTC = f.format(price_rate[2]);
                    });
                  }
                }),
                children: getPickerItems(),
              )),
        ],
      ),
    );
  }
}


// DropdownButton<String>(
//               value: selectedCurrency,
//               items: getDropdownItems(),
//               onChanged: ((value) {
//                 getDropdownItems();

//                 print(value);
//                 setState(() {
//                   selectedCurrency = value!;
//                 });
//               }),
            // ),