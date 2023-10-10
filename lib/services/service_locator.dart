import 'package:afk_project/cubit/cubit.dart';
import 'package:afk_project/data/repository/repository.dart';
import 'package:afk_project/data/web_services/web_services.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;

class ServicesLocator {

  static Future<void> init()async{
    ///

    getIt.registerFactory<AfkCubit>(
            () => AfkCubit(getIt()));


    getIt.registerLazySingleton<WebServices>(
            () => WebServices());
    getIt.registerLazySingleton<Repository>(
            () => Repository(webServices: getIt()));



  }
}
