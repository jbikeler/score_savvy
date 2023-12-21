import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'roundcount_notifier.g.dart';

@riverpod
class RoundNotifier extends _$RoundNotifier {
  @override
  int build() {
    return 0;
  }

  void countUp() {
    state++;
  }

  void countDown() {
    if (state > 0){
      state--;
    }
  }
}