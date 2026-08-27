import 'package:ecommerce/Core/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  // =========================
  // Loading Dialog
  // =========================
  static void showLoading(
    BuildContext context, {
    String message = "Loading...",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Appcolors.WhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          content: Row(
            children: [
              SizedBox(
                width: 25.w,
                height: 25.h,
                child: CircularProgressIndicator(
                  color: Appcolors.primaryBlue,
                  strokeWidth: 3,
                ),
              ),

              SizedBox(width: 16.w),

              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Appcolors.DarkBlue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // =========================
  // Hide Loading
  // =========================
  static void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // =========================
  // Message Dialog
  // =========================
  static void showMessage(
    BuildContext context, {
    required String message,
    String title = "Message",
    String buttonText = "OK",
    VoidCallback? postAction,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Appcolors.WhiteColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),

          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Appcolors.DarkBlue,
            ),
          ),

          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: Appcolors.GrayColor,
            ),
          ),

          actionsAlignment: MainAxisAlignment.center,

          actions: [
            SizedBox(
              width: 120.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  if (postAction != null) {
                    postAction();
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),

                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Appcolors.WhiteColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
