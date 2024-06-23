// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:provider/provider.dart';
// // import 'package:sharemedia_lts/advirtisement/ad_state.dart';

// import 'ad_state.dart';
// import 'anchored_adaptive_banner_adSize.dart';

// class MyBannerADTwo extends StatefulWidget {
//   const MyBannerADTwo({super.key});

//   @override
//   State<MyBannerADTwo> createState() => _MyBannerADTwoState();
// }

// class _MyBannerADTwoState extends State<MyBannerADTwo> {

//   BannerAd? banner;

//   AnchoredAdaptiveBannerAdSize? size;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     // Initialising adState here because it need context
//     // and didChangeDependencies() is called few moments after the state loads its dependencies
//     // so context is available at this moment.
//     final adState2 = Provider.of<AdState2>(context);

//     adState2.initialization.then((value) async {
//       // Assigning the size of adaptive banner ad after adState initialization.
//       size = await anchoredAdaptiveBannerAdSize(context);

//       setState(() {
//         // If adState.bannerAdUnitId is null don't create a BannerAd.
//         if (adState2.bannerAdUnitId != null) {
//           banner = BannerAd(
//             listener: adState2.adListener,
//             adUnitId: adState2.bannerAdUnitId!,
//             request: const AdRequest(),
//             size: size!,
//           )..load();
//         }
//       });
//     });
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     if (banner == null) {
//       // Generally banner is null for very less time only until it get assigned in didChangeDependencies.
//       // Never think that banner will be null if ads fails loads.
//       // To make banner null change the condition in didChangeDependencies or assign null to bannerAdUnitId in AdState().
//       return const SizedBox();
//     } else {
//       return Container(
//         // color: AdState.adStatus ? Color.fromARGB(255, 0, 0, 0) : Colors.transparent,
//         width: AdState2.adStatus ? size!.width.toDouble() : 0,
//         height: AdState2.adStatus ? size!.height.toDouble() : 0,
//         child: AdState2.adStatus
//             // If AdState.adStatus is true then ads loads
//             // but if its false it will display a empty sizedBox.
//             ? AdWidget(
//                 ad: banner!,
//               )
//             : const SizedBox(),
//       );
//     }
//   }
// }