import 'package:get/get.dart';
import 'package:mockapi/presentation/detail/page/detail_task_page.dart';

import '../presentation/detail/get/detail_task_binding.dart';
import '../presentation/home/get/home_binding.dart';
import '../presentation/home/page/home_page.dart';
import '../presentation/splash/get/splash_binding.dart';
import '../presentation/splash/page/splash_page.dart';

const initialPageRoute = SplashPage.routeName;

final GetPage splashPage = GetPage(
  name: SplashPage.routeName,
  page: () => const SplashPage(),
  binding: SplashBinding(),
);

final pageRoutes = [
  splashPage,
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: DetailTaskPage.routeName,
    page: () => const DetailTaskPage(),
    binding: DetailTaskBinding(),
  ),
];
