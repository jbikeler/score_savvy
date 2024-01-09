class AppSettings {
  AppSettings({this.useQuickAdjust = false, this.adjustAmount = 1});

  bool useQuickAdjust;
  int adjustAmount;

  AppSettings copyWith({bool? useQuickAdjust, int? adjustAmount}) {
    return AppSettings(
      useQuickAdjust: useQuickAdjust ?? this.useQuickAdjust,
      adjustAmount: adjustAmount ?? this.adjustAmount,
    );
  }
}
