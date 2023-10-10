import 'package:afk_project/constant/app_colors.dart';
import 'package:afk_project/constant/routes.dart';
import 'package:afk_project/cubit/cubit.dart';
import 'package:afk_project/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AfkCubit>(
          create: (BuildContext context) => getIt(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'afk',
              theme: ThemeData(
                textTheme: TextTheme(
                  displayLarge: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  displaySmall: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.greenColor),
                    foregroundColor: MaterialStateProperty.all(
                        AppColors.blackColorMediumSize),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0.r)),
                    ),
                  ),
                ),
                useMaterial3: true,
              ),
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          }),
    );
  }
}
