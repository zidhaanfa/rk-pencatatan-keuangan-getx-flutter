import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.LOCAL;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': dotenv.env['BASE_URL_LOCAL']!,
    },
    {
      'env': Environments.DEV,
      'url': 'https://admin.dev.fiberzone.id/api/v1/geolocation',
    },
    {
      'env': Environments.QAS,
      'url': 'https://geolocation.api.fiberzone.id',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://geolocation.api.fiberzone.id/api/v1',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
