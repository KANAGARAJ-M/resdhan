///ADDED AUTO-REFRESH

import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:resdhan/Profile/UserProfile.dart';
import 'package:resdhan/Screens/DetaildScreen.dart';
import 'package:resdhan/advirtisement/banner_ad.dart';
import 'package:url_launcher/url_launcher.dart';

class MHomePage extends StatefulWidget {
  const MHomePage({super.key});

  @override
  State<MHomePage> createState() => _MHomePageState();
}

class _MHomePageState extends State<MHomePage> {
  List<dynamic> data = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    loadData();
    _startAutoRefresh();
  }

  void _startAutoRefresh() {
    _timer = Timer.periodic(Duration(minutes: 3), (timer) {
      loadData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> loadData() async {
    final response = await http.get(
      Uri.parse(
        'https://resdhan.netlify.app/rasdhan.json',
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
  // final user = FirebaseAuth.instance.currentUser;
  void _showUserProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Profile Screen'),
        content: Text('Available soon....'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
            onPressed: () => _showUserProfileDialog(context),
            // onPressed: () {
            //   if (user != null) {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProfilePage(userId: user.uid),
            //       ),
            //     );
            //   }
            // },
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
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Image.network(
                            fit: BoxFit.scaleDown,
                            data[index]['Image-Link'],
                            width: 70,
                            height: 70,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                data[index]['App-Title'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                data[index]['Description'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
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
                            height: 100,
                            child: BannerAD(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(data, index)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}




// ///Privacy Policy -  https://www.privacypolicies.com/live/2a5e5059-20aa-48b3-b01b-6345ad5aa469