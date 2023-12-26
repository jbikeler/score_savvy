import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';
import 'package:path_provider/path_provider.dart'; 

final locator = GetIt.instance;

void setup() async{
  Isar isar = await Isar.open([
    GameHistorySchema,
    ],
    inspector: true, //TODO: toggle off for production
    name: 'db_instance', directory: (await getApplicationDocumentsDirectory()).path,);
  locator.registerLazySingleton<Isar>(() => isar); //Local DB with Isar. Call with locator.get<Isar>()
}