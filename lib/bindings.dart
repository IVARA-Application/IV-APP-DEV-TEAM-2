import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/Controllers/notificationController.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(NotificationController());
  }
}
