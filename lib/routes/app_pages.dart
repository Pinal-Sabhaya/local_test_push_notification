import 'package:get/get.dart';
import 'package:push_notification/home/home_binding.dart';
import 'package:push_notification/home/home_view.dart';
part 'app_routes.dart';

class AppPages {
  static const
  INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: '/home',
        page: () => const HomeView(),
        binding: HomeBindings()),
  ];

}
