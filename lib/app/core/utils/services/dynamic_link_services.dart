// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

// class DynamicLinkService {
//   DynamicLinkService._();
//   static DynamicLinkService? _instance;
//   static DynamicLinkService get instance {
//     _instance ??= DynamicLinkService._();
//     return _instance!;
//   }

//   Future<String> createDynamicLink(String path, {bool short = true}) async {
//     // setState(() {
//     //   _isCreatingLink = true;
//     // });

//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://malispos.page.link',
//       // longDynamicLink: Uri.parse(
//       //   'https://flutterfiretests.page.link?efr=0&ibi=io.flutter.plugins.firebase.dynamiclinksexample&apn=io.flutter.plugins.firebase.dynamiclinksexample&imv=0&amv=0&link=https%3A%2F%2Fexample%2Fhelloworld&ofl=https://ofl-example.com',
//       // ),
//       link: Uri.parse("https://malispos.com/$path"),
//       androidParameters: const AndroidParameters(
//         packageName: 'com.example.malispos',
//         minimumVersion: 0,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'com.example.malispos',
//         minimumVersion: '0',
//       ),
//     );

//     Uri url;
//     if (short) {
//       final ShortDynamicLink shortLink =
//           await dynamicLinks.buildShortLink(parameters);
//       url = shortLink.shortUrl;
//     } else {
//       url = await dynamicLinks.buildLink(parameters);
//     }
//     return url.toString();
//   }
// }
