import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../screen/1.2/view/stepper.dart';
import '../screen/1.4/view/change_theme.dart';
import '../screen/1.5(2)/introScreen/introScreen.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/': (context) => isHomed ? const ChangeTheme() : const IntroScreen(),
    '/theme': (context) => const ChangeTheme(),
    '/stepper': (context) => const StepperExample(),
  };
}
