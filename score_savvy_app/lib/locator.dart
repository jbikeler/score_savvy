import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';
import 'package:score_savvy_app/data/database.dart';
import 'package:path_provider/path_provider.dart'; 

final locator = GetIt.instance;

void setup() async{
  final isar = await Isar.open([
    GameHistorySchema,
    ],
    name: 'db_instance', directory: (await getApplicationDocumentsDirectory()).path,);
  locator.registerLazySingleton<AppDatabase>(() => AppDatabase());
  locator.registerLazySingleton<Isar>(() => isar);
}