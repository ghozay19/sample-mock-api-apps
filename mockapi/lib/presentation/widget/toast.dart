import 'package:get/get.dart';

void showToast({String message = '', int duration = 3}) {
  Get.showSnackbar(
    GetSnackBar(
      message: message,
      duration: Duration(seconds: duration),
    ),
  );
}
