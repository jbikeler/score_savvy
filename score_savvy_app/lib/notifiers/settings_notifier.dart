import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/models/settings_model.dart';
import 'package:score_savvy_app/util_services/savegame_service.dart';

part 'settings_notifier.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {

  SettingsNotifier() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    AppSettings saveSettings = await locator.get<SaveService>().getAppSettings();
    state = saveSettings;
    print('The adjust amount is ' + state.adjustAmount.toString());
  }

  @override
  AppSettings build() {
    return AppSettings();
  }

  void toggleQuickAdjust(bool newValue) {
    AppSettings newSettings = state.copyWith(
      useQuickAdjust: newValue,
    );
    state = newSettings;
    locator.get<SaveService>().updateSettings(newSettings);
  }

  void setAdjustAmount(int newAmount) {
    AppSettings newSettings = state.copyWith(
      adjustAmount: newAmount,
    );
    state = newSettings;
    locator.get<SaveService>().updateSettings(newSettings);
    }

}
