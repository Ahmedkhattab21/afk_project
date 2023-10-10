import 'package:afk_project/constant/app_colors.dart';
import 'package:afk_project/constant/app_constant.dart';
import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/constant/media_query_values.dart';
import 'package:afk_project/cubit/cubit.dart';
import 'package:afk_project/cubit/states.dart';
import 'package:afk_project/data/models/get_data/customer.dart';
import 'package:afk_project/data/models/get_data/payment_type.dart';
import 'package:afk_project/data/models/get_data/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class PaymentScreen extends StatelessWidget {
  final double itemId;
  final String itemName;
  final int itemValue;
  final double unitId;

   const PaymentScreen(
      {required this.itemId,
      required this.itemName,
      required this.itemValue,
      required this.unitId,
      super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title:const  Text(AppStrings.buyItem),
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30.h),
              dropdownButton(context),
              SizedBox(height: 30.h),
              itemTextAndCounter(context),
              SizedBox(height: 20.h),
              itemPriceAndTotalPrice(context),
              SizedBox(height: 30.h),
              dropdown(context),
              SizedBox(height: MediaQueryValues(context).height*.2),
              BlocConsumer<AfkCubit, AfkState>(
                listener: (context, state) {
                  if (state is OnSuccessAddPaymentState) {
                    Navigator.pop(context);
                  } else if (state is OnErrorAddPaymentState) {
                    AppConstant.toast(AppStrings.dataWrong);
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (AfkCubit.get(context).store != null &&
                          AfkCubit.get(context).paymentType != null &&
                          AfkCubit.get(context).customerType != null) {
                        AfkCubit.get(context).addPayment(itemId, unitId);
                      } else {
                        AppConstant.toast(AppStrings.chooseAllData);
                      }
                    },
                    child: const Text(AppStrings.payText),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget dropdownButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 20.w,right: 10.w),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(color: AppColors.blackColorMediumSize),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: BlocBuilder<AfkCubit, AfkState>(
              buildWhen: (previous, current) {
                return current is OnChangeCustomerTypeState;
              },
              builder: (context, state) {
                return DropdownButton<Customer>(
                    dropdownColor: AppColors.backgroundColor,
                    isExpanded: true,
                    hint: Text(
                      AppStrings.chooseCustomer,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.blackColorMediumSize,
                      ),
                    ),
                    value: AfkCubit.get(context).customerType,
                    underline: const SizedBox(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.r,
                      color: AppColors.blackColorMediumSize,
                    ),
                    items: AfkCubit.get(context).data[0].customers.map((Customer status) {
                      return DropdownMenuItem<Customer>(
                        value: status,
                        child: Text(
                          status.customerName,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.blackColorMediumSize,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (Customer? value) {
                      AfkCubit.get(context).changeCustomerType(value!);
                    });
              },
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 20.w,right: 10.w),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(color: AppColors.blackColorMediumSize),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: BlocBuilder<AfkCubit, AfkState>(
              buildWhen: (previous, current) {
                return current is OnChangePaymentTypeState;
              },
              builder: (context, state) {
                return DropdownButton<PaymentType>(
                    dropdownColor: AppColors.backgroundColor,
                    isExpanded: true,
                    hint: Text(
                      AppStrings.choosePaymentType,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.blackColorMediumSize,
                      ),
                    ),
                    value: AfkCubit.get(context).paymentType,
                    underline: const SizedBox(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.r,
                      color: AppColors.blackColorMediumSize,
                    ),
                    items: AfkCubit.get(context).data[0].paymentTypes.map((PaymentType status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(
                          status.paymentTypeName,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.blackColorMediumSize,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (PaymentType? value) {
                      AfkCubit.get(context).changePaymentType(value!);
                    });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget itemTextAndCounter(BuildContext context){
    return Row(
      children: [
        Text(itemName, style: Theme.of(context).textTheme.displayLarge),
        const Spacer(),
        InkWell(
          onTap: () {
            AfkCubit.get(context).counterMinus();
            AfkCubit.get(context).allPrice(itemValue);
          },
          child: Text("-", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp)),
        ),
        SizedBox(width: 30.w),
        BlocBuilder<AfkCubit, AfkState>(
          builder: (context, state) {
            return Text(AfkCubit.get(context).counter.toString(),
                style: Theme.of(context).textTheme.displayLarge);
          },
        ),
        SizedBox(width: 30.w),
        InkWell(
          onTap: () {
            AfkCubit.get(context).counterPlus();
            AfkCubit.get(context).allPrice(itemValue);
          },
          child: Text("+", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp)),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }


  Widget dropdown(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 10.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.blackColorMediumSize),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: BlocBuilder<AfkCubit, AfkState>(
        buildWhen: (previous, current) {
          return current is OnChangeCustomerTypeState;
        },
        builder: (context, state) {
          return DropdownButton<Store>(
              dropdownColor: AppColors.backgroundColor,
              isExpanded: true,
              hint: Text(
                AppStrings.chooseStore,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.blackColorMediumSize,
                    ),
              ),
              value: AfkCubit.get(context).store,
              underline: const SizedBox(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20.r,
                color: AppColors.blackColorMediumSize,
              ),
              items: AfkCubit.get(context)
                  .data[0]
                  .stores
                  .map((Store status) {
                return DropdownMenuItem<Store>(
                  value: status,
                  child: Text(
                    status.storeName,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.blackColorMediumSize,
                        ),
                  ),
                );
              }).toList(),
              onChanged: (Store? value) {
                AfkCubit.get(context).changeStore(value!);
              });
        },
      ),
    );
  }

  Widget itemPriceAndTotalPrice(BuildContext context){
    return Row(
      children: [
        Text(itemValue.toString(), style: Theme.of(context).textTheme.displayLarge),
        const Spacer(),
        BlocBuilder<AfkCubit, AfkState>(
          builder: (context, state) {
            return Text((AfkCubit.get(context).counter * itemValue).toString(),
                style: Theme.of(context).textTheme.displayLarge);
          },
        ),
        SizedBox(width: 60.w),
      ],
    );
  }




}
