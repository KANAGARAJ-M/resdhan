import 'package:flutter/material.dart';
import 'package:resdhan/ad2/banner_ad.dart';
import 'package:resdhan/ad3/banner_ad.dart';
import 'package:resdhan/advirtisement/banner_ad.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final List<dynamic> items;
  final int selectedIndex;

  DetailsPage(this.items, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    final selectedItem = items[selectedIndex];
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          selectedItem['App-Title'],
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.network(
                //   selectedItem['image'],
                //   width: 200,
                //   height: 200,
                // ),
                // SizedBox(height: 20),
                // Text(selectedItem['description']),
                // Text(selectedItem['fulldescription']),

                Image.network(
                  selectedItem['Image-Link'],
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  selectedItem['App-Title'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(selectedItem['Description']),

                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: BannerAD(),
                ),

                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 10),
                Text(selectedItem['Full-Description']),
                SizedBox(height: 10),
                Text(
                  'Steps:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 45),
                ),
                SizedBox(height: 10),
                Text(selectedItem['steps']),
                SizedBox(
                  height: 5,
                ),
                // BannerAD(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: BannerAD2(),
                ),

                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Referal Code : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    Text(selectedItem['Referal-Code']),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String linkappopen = selectedItem['Google-Forn-Link'];

                    final Uri _url = Uri.parse(
                        // 'https://t.me/resdhanapps'
                        linkappopen);

                    await launchUrl(
                      // linkappopen as Uri,
                      _url,
                      mode: LaunchMode.externalApplication,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,

                        // ,
                      ),
                    );
                  },
                  child: Text(
                    selectedItem['Google-Form-Button-Text'],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: BannerAD2(),
                ),

                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () async {
                    final String linkappopen =
                        selectedItem['Open-App-Button-Link'];
                    final Uri _url = Uri.parse(linkappopen);
                    await launchUrl(
                      _url,
                      mode: LaunchMode.inAppBrowserView,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
                      ),
                    );
                  },
                  child: Text(
                    // 'Open App',
                    selectedItem['Open-App-Button-Text'],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String linkappopen =
                        selectedItem['Join-Community-Link'];
                    final Uri _url = Uri.parse(linkappopen);
                    await launchUrl(
                      _url,
                      mode: LaunchMode.inAppBrowserView,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
                      ),
                    );
                  },
                  child: Text(
                    // 'Open App',
                    selectedItem['Join-Community-Text'],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  child: BannerAD3(),
                ),
                // BannerAD(),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
