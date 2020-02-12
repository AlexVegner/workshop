import 'package:flutter/material.dart';
import 'package:flutter_flavors/config/device_info_dialog.dart';
import 'package:flutter_flavors/config/flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  BannerConfig bannerConfig;
  FlavorBanner({@required this.child});

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;
    bannerConfig ??= _getDefaultBanner();
    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.flavor.toString().split('.').last,
        bannerColor: FlavorConfig.instance.flavor == Flavor.DEV
            ? Colors.green
            : Colors.purple);
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
              message: bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: bannerConfig.bannerColor),
        ),
      ),
      onDoubleTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeviceInfoDialog();
            });
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({@required this.bannerName, @required this.bannerColor});
}
