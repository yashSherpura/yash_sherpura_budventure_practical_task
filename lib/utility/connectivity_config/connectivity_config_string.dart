import 'package:yash_sherpura_budventure_task/constants/api_keys.dart';

class ConnectivityConfigString {
  factory ConnectivityConfigString() => _singleton;

  ConnectivityConfigString._internal();

  static final ConnectivityConfigString _singleton =
      ConnectivityConfigString._internal();

  static ConnectivityConfigString get shared => _singleton;

  String? checkInternetUrl;

  String getCheckInternetUrl() {
    return checkInternetUrl ??
        ('https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf&hl=en${ApiKeys.apiPing}');
  }
}
