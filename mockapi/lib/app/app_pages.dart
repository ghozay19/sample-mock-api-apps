import 'package:get/get.dart';

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
];
