// import 'dart:convert';

// // import 'package:resdhan.kaizenapps.com/Screens/DetaildScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:http/http.dart' as http;
// import 'package:resdhan/Screens/DetaildScreen.dart';
// import 'package:resdhan/advirtisement/banner_ad.dart';
// // import 'package:money_crafter/Screens/DetaildScreen.dart';

// // import 'package:money_crafter/main.dart';

// class MHomePage extends StatefulWidget {
//   const MHomePage({super.key});

//   @override
//   State<MHomePage> createState() => _MHomePageState();
// }

// class _MHomePageState extends State<MHomePage> {
//   List<dynamic> data = [];

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     final response = await http.get(
//         Uri.parse('https://kaizenjsonfiles.netlify.app/MoneyCrafter.json'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         data = jsonData['apps'];
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[200],
//         title: Text(
//           'ResDhan',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         actions: [
//           IconButton.outlined(
//             onPressed: () {},
//             icon: Icon(
//               Icons.account_circle_outlined,
//               color: Colors.black,
//               fill: BorderSide.strokeAlignCenter,
//             ),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return SingleChildScrollView(
//               child: GestureDetector(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Container(
//                     width: MediaQuery.sizeOf(context).width / 0.2,
//                     color: Colors.blue[200],
//                     height: 150,
//                     child: SizedBox(
//                       // height: 100,
//                       // color: Colors.blue[300],
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // BannerAD(),

//                           Image.network(
//                             data[index]['image'],
//                             width: 70,
//                             height: 70,
//                           ),
//                           Container(
//                             // width: MediaQuery.sizeOf(context).width/0.2,
//                             // color: Colors.blue[200],
//                             child: Center(
//                               child: Text(
//                                 data[index]['name'],
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 34,
//                                   fontStyle: FontStyle.italic,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               // Container(
//                               //   child: BannerAD(),
//                               // )
//                               // BannerAD(),

//                             ],
//                           )
//                           // BannerAD(),
//                         ],
//                       ),

//                     ),
//                   ),
//                 ),

//                 // subtitle: Text(data[index]['description']),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => DetailsPage(data, index)),
//                   );
//                 },
//               ),
//               // BannerAd();
//             );
//           }),
//     );
//   }
// }

import 'dart:convert';

// import 'package:resdhan.kaizenapps.com/Screens/DetaildScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:resdhan/Profile/UserProfile.dart';
import 'package:resdhan/Screens/DetaildScreen.dart';
import 'package:resdhan/advirtisement/banner_ad.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:money_crafter/Screens/DetaildScreen.dart';

// import 'package:money_crafter/main.dart';

class MHomePage extends StatefulWidget {
  const MHomePage({super.key});

  @override
  State<MHomePage> createState() => _MHomePageState();
}

class _MHomePageState extends State<MHomePage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final response = await http.get(
      Uri.parse(
        'https://resdhan.netlify.app/rasdhan.json',
        // 'assets/jsons/rasdhan.json',
      ),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        data = jsonData['apps'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          'ResDhan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton.outlined(
            onPressed: () async {
              final Uri _url = Uri.parse(
                  'https://www.privacypolicies.com/live/2a5e5059-20aa-48b3-b01b-6345ad5aa469');

              await launchUrl(
                _url,
                mode: LaunchMode.inAppBrowserView,
                webViewConfiguration: const WebViewConfiguration(
                  enableJavaScript: true,

                  // ,
                ),
              );
            },
            icon: Icon(
              Icons.privacy_tip,
              color: Colors.black,
              fill: BorderSide.strokeAlignCenter,
            ),
          ),
          IconButton.outlined(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Userprofile(),
                ),
              );
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
              fill: BorderSide.strokeAlignCenter,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 0.2,
                    color: Colors.blue[200],
                    height: 250,
                    child: Column(
                      // height: 100,
                      // color: Colors.blue[300],
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // BannerAD(),
                            SizedBox(
                              height: 5,
                            ),
                            Image.network(
                              // alignment: Alignment.topCenter,
                              fit: BoxFit.scaleDown,

                              data[index]['image'],
                              width: 70,
                              height: 70,
                            ),
                            Container(
                              // width: MediaQuery.sizeOf(context).width/0.2,
                              // color: Colors.blue[200],
                              child: Center(
                                child: Text(
                                  data[index]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 34,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // width: MediaQuery.sizeOf(context).width/0.2,
                              // color: Colors.blue[200],
                              child: Center(
                                child: Text(
                                  data[index]['description'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              // alignment: Alignment.center,
                              height: 100,
                              // width: MediaQuery.of(context).size.width-2,
                              child: BannerAD(),
                            ),

                            // BannerAD(),
                          ],
                        ),
                        // BannerAD(),
                      ],
                    ),
                  ),
                ),

                // subtitle: Text(data[index]['description']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(data, index)),
                  );
                },
              ),
              // BannerAd();
            );
          }),
    );
  }
}



///Privacy Policy -  https://www.privacypolicies.com/live/2a5e5059-20aa-48b3-b01b-6345ad5aa469