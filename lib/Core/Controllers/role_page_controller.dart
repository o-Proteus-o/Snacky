import 'package:get/get.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Features/Customers/Presentation/Screens/customer_screen.dart';
import 'package:snacky/Shared/Dialog/feedback.dart';

class RolePageController extends GetxController {
  void completeOnboarding(String role) async {
    await SharedPrefsService.instance.setUserRole(role);
    if (role == 'seller') {
      // Get.offAll(() => SellerHome());
      FeedbackService.showConfirm(
        message: "You Sure You Are A Seller",
        onConfirm: () {
          // Navigate to SellerHome
        },
      );
      // FeedbackService.showError("message");
    } else if (role == 'driver') {
      // Get.offAll(() => DriverHome());
      // FeedbackService.showSuccess("message");
      FeedbackService.showConfirm(
        message: "You Sure You Are A Driver",
        onConfirm: () {},
      );
    } else {
      FeedbackService.showConfirm(
        message: "You Sure You Are A Customer",
        onConfirm: () {
          // Navigate to CustomerHome
          Get.offAll(() => CustomerScreen(), transition: Transition.fadeIn);
        },
      );
      // Get.offAll(() => CustomerHome());
    }
  }
}
