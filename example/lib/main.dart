import 'package:flutter/material.dart';
import 'package:country_selector_widget/country_selector.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Country Selector Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(title: 'Country Selector Demo Page'),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key, required this.title});
  final String title;

  Future<void> showSuccessDialog(
    BuildContext context,
    Country country,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '[onSelectedCountry]',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('${country.toJson()}'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Country Selector Widget",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              // show country selector bottom sheet widget
              await showCountrySelectorBottomSheet(
                context: context,
                // enable dialCode instead of selected circle
                withDialCode: true,
                // set the default selected country
                refCountryCode: "HK",
                onSelectedCountry: (country) async {
                  // dialog to show the info of the country object
                  await showSuccessDialog(
                    context,
                    country,
                  );
                }, onBuilded: (){}, onClosed: (){},
              );
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.5,
                ),
                color: Colors.grey.shade200,
                child: const Text(
                  "showBottomSheet",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: CountrySelectorWidget(
        // select the Chinese locale to label the text rather than English
        selectedLocale: SelectedLocale.zhCH,
        // set the default selected country
        refCountryCode: "hk",
        // callback of the selected country
        onSelectedCountry: (country) async {
          // dialog to show the info of the country object
          await showSuccessDialog(
            context,
            country,
          );
        }, onBuilded: (){},
      ),
    );
  }
}
