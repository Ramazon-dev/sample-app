import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/auth/auth_controller.dart';
import 'package:sample_app_getx/controller/main/auth/sing_in_controller.dart';

class Authbindigns extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
