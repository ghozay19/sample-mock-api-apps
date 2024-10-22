import 'package:get/get.dart';

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
        ///TODO move to homepage.
      },
    );
  }
}
