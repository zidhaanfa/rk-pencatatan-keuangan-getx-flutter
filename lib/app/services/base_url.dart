import 'base_domain.dart';

class UrlDomain {
  UrlDomain._();
  static String url = ConfigEnvironments.getEnvironments()['url']!;
}

class PathDomain {
  PathDomain._();

  static String api = '/api';
}

class URL {
  URL._();
  static String login = "${UrlDomain.url}${PathDomain.api}/login";
}
