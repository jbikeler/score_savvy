import 'package:isar/isar.dart';

part 'settings_collection.g.dart';

@collection
class SavedSetting {
  SavedSetting({
    this.id,
    this.quickAdjust,
    this.adjustAmount,
  });

  Id? id;
  bool? quickAdjust;
  int? adjustAmount;
}