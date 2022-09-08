import 'package:get_it/get_it.dart';
import 'package:q8_task/service/dio_service.dart';

final locator = GetIt.instance;
void inject() {
  //REPOSITORIES///
  locator.registerLazySingleton(() => DioService());
}
