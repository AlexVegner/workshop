import 'package:flutter/foundation.dart';

enum Flavor { DEV, PRODUCTION }

final _productionBaseUrl = 'https://';
final _developmentBaseUrl = 'https://';

final _productionAppName = 'Flutter Flavors';
final _developmentAppName = 'Flutter Flavors Dev';

class _AppNameResolver {
  static String nameFromFlavor(Flavor flavor) {
    String appName;
    switch (flavor) {
      case Flavor.PRODUCTION:
        appName = _productionAppName;
        break;
      case Flavor.DEV:
        appName = _developmentAppName;
        break;
    }
    return appName;
  }
}

class _BaseUrlResolver {
  static String baseUrlFromFlavor(Flavor flavor) {
    String baseURL;
    switch (flavor) {
      case Flavor.PRODUCTION:
        baseURL = _productionBaseUrl;
        break;
      case Flavor.DEV:
        baseURL = _developmentBaseUrl;
        break;
    }
    return baseURL;
  }
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String baseURL;

  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
  }) {
    _instance ??= FlavorConfig._internal(
        flavor,
        _AppNameResolver.nameFromFlavor(flavor),
        _BaseUrlResolver.baseUrlFromFlavor(flavor));
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.baseURL);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
}
