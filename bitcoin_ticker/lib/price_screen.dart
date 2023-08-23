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
  final Stopwatch _stopwatch = Stopwatch();

  bool isLoading = false; // Track the loading state

  // This method is called when the widget is inserted into the tree.
  @override
  void initState() {
    super.initState();
    // Perform initialization tasks here.
    print('Widget is being initialized');
    updatePrice(0);
  }

  String _result = "xx ms";
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

  // Calling an async method from a regular method
  void updatePrice(selectedIndex) async {
    _stopwatch.start();

    setState(() {
      isLoading = true; // Start showing the loading indicator
    });
    final price = Price();

    print(selectedIndex);
    selectedCurrency = currenciesList[selectedIndex];

    var price_rate = await price.getPrice(selectedCurrency);

    print('CALLLED ON INIT price_rate $price_rate');

    if (price_rate != null) {
      setState(() {
        selectedCurrencyShow = selectedCurrency;

        rateBTC = f.format(price_rate[0]);
        rateETH = f.format(price_rate[1]);
        rateLTC = f.format(price_rate[2]);
      });
    }
    _stopwatch.stop();
    setState(() {
      isLoading = false; // Start showing the loading indicator
      _result = 'fetch: ${_stopwatch.elapsed.inSeconds} seconds';
    });
    _stopwatch.reset();
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
      body: Stack(
        children: [
          Column(
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
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
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
              Column(
                children: [
                  Container(
                    height: 16.0,
										alignment: Alignment.bottomRight,
                    
                    child: Text(
                      _result,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  Container(
                    height: 220.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 10.0),
                    color: Colors.lightBlue,
                    child: CupertinoPicker(
                      backgroundColor: Colors.lightBlueAccent,
                      itemExtent: 32.0,
                      onSelectedItemChanged: ((selectedIndex) async {
                        updatePrice(selectedIndex);
                      }),
                      children: getPickerItems(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isLoading) // Loading overlay
            Container(
                color: Colors.black
                    .withOpacity(0.5), // Semi-transparent black background
                child: Center(
                  child: CircularProgressIndicator(),
                )),
        ],
      ),
    );
  }
}
