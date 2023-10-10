import 'package:afk_project/constant/app_colors.dart';
import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextFieldWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final EnumTextField enumTextField;
  final TextEditingController? controller;

  const TextFieldWidget({
    required this.formKey,
    required this.enumTextField,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        maxLines: 1,
        textAlign: TextAlign.start,
        enableSuggestions: true,
        controller: controller,
        keyboardType: keyboardType(enumTextField),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.blackColor,
              fontSize: 14.sp,
            ),
        cursorColor: AppColors.blackColor,
        decoration: textFormFieldInputDecoration(context),
        onChanged: (String value){

        },
        validator: (String? value) => validatorTextFormField(
          value: value,
          enumTextField: enumTextField,
        ),
      ),
    );
  }

  validatorTextFormField({
    required value,
    required EnumTextField enumTextField,
  }) {
    if (enumTextField == EnumTextField.userName) {
      if (value!.isEmpty) {
        return AppStrings.validateTextUserName;
      }
      return null;
    } else if (enumTextField == EnumTextField.password ) {
      if (value!.isEmpty) {
        return AppStrings.validateTextFieldPassword;
      }
      return null;
    } else {}
  }

  InputDecoration textFormFieldInputDecoration(BuildContext context) {
    return InputDecoration(
      counterText: "",
      hintText: hintTextForTextFormField(enumTextField),
      labelStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 14.sp,
            color: AppColors.blackColor,
          ),
      hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: AppColors.resentInColor,
        fontSize: 14.sp,
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h),
      filled: true,
      fillColor: AppColors.whiteColor,
      enabledBorder: textFormFieldCircularBorder(AppColors.greyOfWhite, 14.r),
      focusedBorder: textFormFieldCircularBorder(AppColors.greyOfWhite, 14.r),
      focusedErrorBorder: textFormFieldCircularBorder(AppColors.errorColor, 14.r),
      errorBorder:  textFormFieldCircularBorder(AppColors.errorColor, 14.r),
    );
  }

  TextInputType keyboardType(EnumTextField enumTextField) {
    if (enumTextField == EnumTextField.userName) {
      return TextInputType.text;
    } else if (enumTextField == EnumTextField.password) {
      return TextInputType.visiblePassword;
    }
    else {
      return TextInputType.name;
    }
  }

  OutlineInputBorder textFormFieldCircularBorder(Color color, double radius) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  String hintTextForTextFormField(EnumTextField enumTextField) {
    if (enumTextField == EnumTextField.userName) {
        return AppStrings.userName;
    } else if (enumTextField == EnumTextField.password) {
      return AppStrings.registerFormFieldPassword;
    } else {
      return "";
    }
  }
}
