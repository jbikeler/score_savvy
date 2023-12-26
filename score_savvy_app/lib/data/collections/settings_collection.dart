import 'package:isar/isar.dart';

part 'settings_collection.g.dart';

@collection
class Setting {
  Setting({
    this.quickAdjust,
    this.adjustAmount,
  });

  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  bool? quickAdjust;
  int? adjustAmount;
}