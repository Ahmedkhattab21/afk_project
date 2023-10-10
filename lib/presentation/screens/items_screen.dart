import 'package:afk_project/constant/app_colors.dart';
import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/cubit/cubit.dart';
import 'package:afk_project/cubit/states.dart';
import 'package:afk_project/presentation/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  void initState() {
    super.initState();
    AfkCubit.get(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AfkCubit, AfkState>(
      builder: (context, state) {
        if(state is OnLoadingGetDataState){
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.dataDetails),
              elevation: 4,
            ),
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.blackColorMediumSize,
              ),
            ),
          );
        }else if(AfkCubit.get(context).data.isNotEmpty){
          return Scaffold(
            appBar: AppBar(
              title: Text(AfkCubit.get(context).data[0].storeName),
              elevation: 4,
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: AfkCubit.get(context).data[0].items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    AfkCubit.get(context).clearData();
                    Navigator.pushNamed(context, AppStrings.paymentScreen,
                        arguments: AfkCubit.get(context).data[0].items[index]);
                  },
                  child: ProductCard(
                    itemName: AfkCubit.get(context).data[0].items[index].itemName,
                    itemValue:
                        AfkCubit.get(context).data[0].items[index].itemValue,
                  ),
                );
              },
            ),
          );
        }else {
          return Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.dataDetails),
                elevation: 4,
              ),
              body: Center(
            child: Text(
              AppStrings.noItemsText,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ));
        }
      },
    );
  }
}
