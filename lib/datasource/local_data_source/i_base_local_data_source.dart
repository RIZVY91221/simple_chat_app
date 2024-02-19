import 'dart:async';

import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class ImplementBaseLocalDataSource implements BaseLocalDataSource {
  @override
  Future initBoxes(List<String> boxs) async {
    //Hive.ignoreTypeId(0);
    for (String tag in boxs) {
      await Hive.openBox(tag);
    }
  }
}
