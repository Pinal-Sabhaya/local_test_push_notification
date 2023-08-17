import 'package:get/get.dart';
import 'package:push_notification/home/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
  }

}