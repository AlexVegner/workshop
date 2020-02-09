import 'package:flutter/material.dart';

import 'app.dart' as app;
import 'common/config/injector.dart';
import 'common/config/log_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjections();
  setupLogger();
  app.main();
}
