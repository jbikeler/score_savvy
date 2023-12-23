import 'package:get_it/get_it.dart';
import 'package:score_savvy_app/data/database.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<AppDatabase>(() => AppDatabase());
}