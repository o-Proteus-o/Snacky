import 'package:get/get.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Shared/Dialog/feedback.dart';

class RolePageController extends GetxController {
  void completeOnboarding(String role) async {
    await SharedPrefsService.instance.setUserRole(role);
    if (role == 'seller') {
      // Get.offAll(() => SellerHome());
      FeedbackService.showError("message");
    } else if (role == 'driver') {
      // Get.offAll(() => DriverHome());
      FeedbackService.showSuccess("message");
    } else {
      // Get.offAll(() => CustomerHome());
    }
  }
}
