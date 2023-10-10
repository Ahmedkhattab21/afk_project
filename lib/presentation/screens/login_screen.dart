import 'package:afk_project/constant/app_colors.dart';
import 'package:afk_project/constant/app_constant.dart';
import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/constant/enums.dart';
import 'package:afk_project/constant/media_query_values.dart';
import 'package:afk_project/cubit/cubit.dart';
import 'package:afk_project/cubit/states.dart';
import 'package:afk_project/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQueryValues(context).height * .03),
              title(context),
              SizedBox(height: MediaQueryValues(context).height * .1),
              userNameTextFieldWidget(context),
              SizedBox(height: MediaQueryValues(context).height * .03),
              passwordTextFieldWidget(context),
              SizedBox(height: MediaQueryValues(context).height * .026),
              buttonLogIn(context),
              SizedBox(height: MediaQueryValues(context).height * .35),
            ],
          ),
        ),
      ),
    );
  }

  Text title(BuildContext context) {
    return Text(
      AppStrings.signInScreenTitle,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: MediaQueryValues(context).height > 500 ? 26.sp : 20.sp,
            color: AppColors.blackColorMediumSize,
          ),
    );
  }

  Widget userNameTextFieldWidget(BuildContext context) {
    return TextFieldWidget(
      formKey: AfkCubit.get(context).userNameFormKey,
      enumTextField: EnumTextField.userName,
      controller: AfkCubit.get(context).userNameController,
    );
  }

  Widget passwordTextFieldWidget(BuildContext context) {
    return TextFieldWidget(
      formKey: AfkCubit.get(context).passwordFormKey,
      enumTextField: EnumTextField.password,
      controller: AfkCubit.get(context).passwordController,
    );
  }

  Widget buttonLogIn(BuildContext context) {
    return BlocConsumer<AfkCubit, AfkState>(
      listener: (context, state) {
        if (state is OnSuccessLoginState) {
          Navigator.pushReplacementNamed(context, AppStrings.itemScreen);
        } else if (state is OnErrorLoginState) {
          AppConstant.toast(AppStrings.errorLoginText);
        }
      },
      builder: (context, state) {
        if (state is OnLoadingLoginState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.blackColorMediumSize,
            ),
          );
        } else {
          return ElevatedButton(
            onPressed: () {
              if (!AfkCubit.get(context)
                      .userNameFormKey
                      .currentState!
                      .validate() ||
                  !AfkCubit.get(context)
                      .passwordFormKey
                      .currentState!
                      .validate()) {
                return;
              }
              FocusScope.of(context).unfocus();
              AfkCubit.get(context).userNameFormKey.currentState!.save;
              AfkCubit.get(context).passwordFormKey.currentState!.save;
              AfkCubit.get(context).login();
            },
            child: const Text(AppStrings.loginText),
          );
        }
      },
    );
  }
}
