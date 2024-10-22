import 'package:get/get.dart';

import '../../home/page/home_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    initApps();
    super.onInit();
  }

  void initApps() {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        Get.offAllNamed(HomePage.routeName);
      },
    );
  }
}
