import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gamename_notifier.g.dart';

@riverpod
class GameNameNotifier extends _$GameNameNotifier {
  @override
  String build() {
    return 'New Game';
  }

  void editName(String newName) {
    state = newName;
  }
}