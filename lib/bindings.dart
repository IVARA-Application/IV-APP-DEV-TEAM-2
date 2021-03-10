import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }
}
