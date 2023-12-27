import 'package:get_it/get_it.dart';
import 'package:score_savvy_app/util_services/savegame_service.dart'; 

final locator = GetIt.instance;

void setup() async{
  locator.registerLazySingleton<SaveService>(() => SaveService()); //Local DB with Isar. Call with locator.get<SaveService>()
}