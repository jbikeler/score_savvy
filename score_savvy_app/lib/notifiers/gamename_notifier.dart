import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/util_services/savegame_service.dart';

part 'gamename_notifier.g.dart';

@riverpod
class GameNameNotifier extends _$GameNameNotifier {

  GameNameNotifier() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    String saveName = await locator.get<SaveService>().getCurrentName();
    state = saveName;
  }

  @override
  String build() {
    return 'New Game';
  }

  void editName(String newName) {
    state = newName;
    locator.get<SaveService>().updateGameName(state);
  }
}