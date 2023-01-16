import 'package:flutter/foundation.dart';

class Constants {
  //Routes
  static final String RootRoute = '/';
  static final String MySimpleDialog = '/MySimpleDialog';
  static final String MyFloatButton = '/MyFloatButton';
  static final String MyBottomNav = '/MyBottomNav';

  static double elevation() {
    return defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 3.0;
  }
}
