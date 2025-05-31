import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';

class FeedbackService {
  static void showSuccess(String message, {String title = "Success"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      // snackPosition: SnackPosition.BOTTOM,
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.all(12),
    );
  }

  static void showError(String message, {String title = "Error"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(12),
    );
  }

  static void showLoading({String message = "Please wait..."}) {
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(24),
      backgroundColor: Colors.white,
      radius: 16,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color:
                  Brightness.light == Brightness.light
                      ? Colors.white
                      : Colors.grey.shade800,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  static void showConfirm({
    required String message,
    String title = "Confirmation",
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(24),
      backgroundColor: Colors.white,
      radius: 16,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon container
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.help_outline,
              size: 32,
              color: Colors.orange.shade600,
            ),
          ),
          SizedBox(height: 20),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),

          // Message
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),

          // Buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.grey.shade700,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
