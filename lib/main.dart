// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'JSON File Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: JsonDemoPage(),
//     );
//   }
// }

// class JsonDemoPage extends StatefulWidget {
//   @override
//   _JsonDemoPageState createState() => _JsonDemoPageState();
// }

// class _JsonDemoPageState extends State<JsonDemoPage> {
//   List<dynamic> data = [];

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     final response = await http.get(Uri.parse('https://kaizenjsonfiles.netlify.app/items.json'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         data = jsonData['items'];
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('JSON File Demo'),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return ListTile(
//               leading: Image.network(
//                 data[index]['image'],
//                 width: 50,
//                 height: 50,
//               ),
//               title: Text(data[index]['name']),
//               subtitle: Text(data[index]['description']),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DetailsPage(data[index])),
//                 );
//               },
//             );
//           } else {
//             return ListTile(
//               leading: Image.network(
//                 data[index]['image'],
//                 width: 50,
//                 height: 50,
//               ),
//               title: Text(data[index]['name']),
//               subtitle: Text(data[index]['description']),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class DetailsPage extends StatelessWidget {
//   final dynamic item;

//   DetailsPage(this.item);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item['name']),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               item['image'],
//               width: 200,
//               height: 200,
//             ),
//             SizedBox(height: 20),
//             Text(item['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';


// import 'package:resdhan.kaizenapps.com/Login/Login.dart';
// import 'package:resdhan.kaizenapps.com/Screens/Home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resdhan/Login/Login.dart';
import 'package:resdhan/Screens/Home.dart';
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

///moneycrafter.kaizen.com
///flutter pub run change_app_package_name:main moneycrafter.kaizen.com
///flutter pub run change_app_package_name:main resdhan.kaizenapps.com
///flutter pub run flutter_project_name_changer:main resdhan.kaizenapps.com
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(MyApp());
  runApp(Provider.value(
    value: adState,
    builder: (context, child) => MyApp(),
  ));
}

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Money Crafter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: HpContView(),
//       debugShowCheckedModeBanner: false,
//       home: MHomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResDhan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HpContView(),
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}

// class JsonDemoPage extends StatefulWidget {
//   @override
//   _JsonDemoPageState createState() => _JsonDemoPageState();
// }

// class _JsonDemoPageState extends State<JsonDemoPage> {
//   List<dynamic> data = [];

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     final response = await http.get(Uri.parse('https://kaizenjsonfiles.netlify.app/items.json'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         data = jsonData['items'];
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('JSON File Demo'),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.network(
//               data[index]['image'],
//               width: 50,
//               height: 50,
//             ),
//             title: Text(data[index]['name']),
//             subtitle: Text(data[index]['description']),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DetailsPage(data, index)),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class DetailsPage extends StatelessWidget {
//   final List<dynamic> items;
//   final int selectedIndex;

//   DetailsPage(this.items, this.selectedIndex);

//   @override
//   Widget build(BuildContext context) {
//     final selectedItem = items[selectedIndex];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(selectedItem['name']),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               selectedItem['image'],
//               width: 200,
//               height: 200,
//             ),
//             SizedBox(height: 20),
//             Text(selectedItem['description']),
//             Text(selectedItem['fulldescription']),
//           ],
//         ),
//       ),
//     );
//   }
// }