import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mockapi/app/const/app_endpoints.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<Dio>(
      dio(),
      permanent: true,
    );
  }

  Dio dio() {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(minutes: 1),
      ),
    );

    return dioInstance;
  }
}
