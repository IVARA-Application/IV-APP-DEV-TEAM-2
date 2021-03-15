import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';

class ScheduleACallMethods {
  static Future onSubmit({name, phoneNumber, slot, problem}) async {
    var value = await Get.find<AuthController>()
        .scheduleACall(name, phoneNumber, slot, problem);

    print(value);
    if (value) {
      Get.showSnackbar(
       GetBar(
         title: "Success",
         message: "This call is scheduled",
         duration: Duration(seconds: 1),
       )
      );
    }
  }
}
