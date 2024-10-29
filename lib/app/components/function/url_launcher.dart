import 'package:url_launcher/url_launcher.dart';

Future<void> urlWeb(String url) async {
  if (await launch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
