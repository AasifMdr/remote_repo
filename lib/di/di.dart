import 'package:get_it/get_it.dart';
import 'package:remote_repo/data_source/local/local_datasource.dart';
import 'package:remote_repo/data_source/remote/remote_datasource.dart';
import 'package:remote_repo/repository/user_repository.dart';

final getIt = GetIt.instance;

void initModule() {
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource());
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(getIt(), getIt()));
}
