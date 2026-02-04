import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  DioHelper dio = DioHelper();
  sl.registerSingleton<DioHelper>(dio);
  

  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));

}