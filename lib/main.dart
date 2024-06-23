import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resdhan/Login/Login.dart';
import 'package:resdhan/Profile/UserProfile.dart';
import 'package:resdhan/ad2/ad_state.dart';
import 'package:resdhan/ad3/ad_state.dart';
// import 'package:resdhan/Screens/Home.dart';
import 'package:resdhan/advirtisement/ad_state.dart';

import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> _NotificationPermission() async {
  var status = await Permission.notification.status;
  if (status.isDenied) {
    status = await Permission.notification.request();
    if (status.isDenied) {
      // Handle the denied state
    }
  } else {}
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  final adState2 = AdState2(initFuture);
  final adState3 = AdState3(initFuture);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _NotificationPermission();
  // runApp(MyApp());
  // METHOD2
  // runApp(Provider.value(
  //   value: adState,
  //   builder: (context, child) => MyApp(),
  // ));
  //METHOD3
  runApp(
    MultiProvider(
      providers: [
        Provider<AdState>.value(value: adState),
        Provider<AdState2>.value(value: adState2),
        Provider<AdState3>.value(value: adState3),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResDhan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      routes: {
        '/login': (context) => LoginPage(),
        '/profile': (context) =>
            ProfilePage(userId: FirebaseAuth.instance.currentUser!.uid),
      },
    );
  }
}
