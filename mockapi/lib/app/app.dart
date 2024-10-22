import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialPageRoute,
      getPages: pageRoutes,
      unknownRoute: Get.currentRoute.isEmpty ? splashPage : null,
    );
  }
}
