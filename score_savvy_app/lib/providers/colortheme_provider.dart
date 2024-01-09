import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'colortheme_provider.g.dart';

@riverpod
Color appThemeColor(AppThemeColorRef ref) =>  const Color.fromARGB(255, 93, 143, 235);