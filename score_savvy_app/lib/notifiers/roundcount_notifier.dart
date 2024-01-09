import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/util_services/savegame_service.dart';

part 'roundcount_notifier.g.dart';

@riverpod
class RoundNotifier extends _$RoundNotifier {

  RoundNotifier() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    int saveRound = await locator.get<SaveService>().getCurrentRound();
    state = saveRound;
  }

  @override
  int build() {
    return 0;
  }

  void countUp() {
    state++;
    locator.get<SaveService>().updateRound(state);
  }

  void countDown() {
    if (state > 0){
      state--;
      locator.get<SaveService>().updateRound(state);
    }
  }
}