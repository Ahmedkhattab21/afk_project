
import 'package:afk_project/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AppConstant{
  static void toast(String message) {
    return Toast.show(
      message,
      duration: 2,
      gravity: Toast.bottom,
      backgroundColor: AppColors.toastBackGroundColor,
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.errorColor,
      ),
    );
  }
}