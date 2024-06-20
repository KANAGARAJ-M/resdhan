import 'package:flutter/material.dart';
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
          selectedItem['name'],
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
                  selectedItem['image'],
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  selectedItem['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(selectedItem['description']),
                SizedBox(height: 10),
                Text(selectedItem['fulldescription']),
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
                SizedBox(height: 5,),
                // BannerAD(),
                SizedBox(height: 5,),
                Container(
                  height: 100,
                  child: BannerAD(),
                ),
                // Text(selectedItem['fulldescription']),
                SizedBox(height: 10),
                // Text(selectedItem['fulldescription']),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Referal Code',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 45),
                ),
                Text(selectedItem['referal-code']),
                
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {
                    final String linkappopen = selectedItem['google-form'];
            
                    final Uri _url = Uri.parse('https://t.me/resdhanapps');
            
                    await launchUrl(
                      _url,
                      mode: LaunchMode.externalApplication,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
            
                        // ,
                      ),
                    );
                  },
                  child: Text(
                    'Join Community',
                  ),
                ),
                SizedBox(height: 10),
            
                ElevatedButton(
                  onPressed: () async {
                    final String linkappopen = selectedItem['app-link'];
            
                    final Uri _url = Uri.parse(linkappopen);
            
                    await launchUrl(
                      _url,
                      mode: LaunchMode.inAppBrowserView,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
            
                        // ,
                      ),
                    );
            
                    // if (await canLaunchUrl(linkappopen as Uri)) {
                    //   debugPrint(' working');
                    //   await launchUrl(linkappopen as Uri,
                    //       mode: LaunchMode.externalApplication,
                    //       webViewConfiguration:
                    //           const WebViewConfiguration(
                    //               enableJavaScript: true));
                    // } else {
                    //   throw Exception('Not Launch $linkappopen');
                    //   debugPrint('Not working');
                    // }
                    // const url = '';
                  },
                  child: Text(
                    'Open App',
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 100,
                  child: BannerAD(),
                ),
                // BannerAD(),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}