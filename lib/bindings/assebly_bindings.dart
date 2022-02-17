import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/assembly/assembly_controller.dart';

class AssemblyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssemblyController());
  }
}
