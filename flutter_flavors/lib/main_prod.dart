import 'package:flutter/material.dart';
import 'package:flutter_flavors/config/flavor_config.dart';
import 'package:flutter_flavors/my_app.dart';

void main() {
  FlavorConfig(flavor: Flavor.PRODUCTION);
  runApp(MyApp());
}
