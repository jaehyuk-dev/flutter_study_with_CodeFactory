import 'package:dio/dio.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class StatRepository {
  static Future<void> fetchData() async {
    final isar = GetIt.I<Isar>();
    final now = DateTime.now();
    final compareDateTimeTarget =
        DateTime(now.year, now.month, now.day, now.hour);

    final count = await isar.statModels
        .filter()
        .dataTimeEqualTo(compareDateTimeTarget)
        .count();

    if (count > 0) {
      print("데이터 존재!");
    }

    for (ItemCode itemCode in ItemCode.values) {
      await fetchDataByItemCode(itemCode: itemCode);
    }
  }

  static Future<List<StatModel>> fetchDataByItemCode(
      {required ItemCode itemCode}) async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey':
            'Dj07aM/6WoP8iFN1iyg/Lkd6EBG6p5YpChDD2i1E6tRu/bHeUBGk/MD+fGzkSsTBa+RlzeB4UpNq2NQjyJf9PQ==',
        'returnType': 'json',
        'numOfRows': 100,
        'pageNo': 1,
        'itemCode': itemCode.name,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      },
    );

    final rawItemsList = response.data['response']['body']['items'];

    List<StatModel> stats = [];

    final List<String> skipKeys = [
      'dataGubun',
      'dataTime',
      'itemCode',
    ];

    for (Map<String, dynamic> item in rawItemsList) {
      final dataTime = DateTime.parse(item['dataTime']);

      for (String key in item.keys) {
        if (skipKeys.contains(key)) continue;

        final stat = double.parse(item[key]);
        final region = Region.values.firstWhere((e) => e.name == key);

        final statModel = StatModel()
          ..region = region
          ..stat = stat
          ..dataTime = dataTime
          ..itemCode = itemCode;

        final isar = GetIt.I<Isar>();

        final count = await isar.statModels
            .filter()
            .regionEqualTo(region)
            .dataTimeEqualTo(dataTime)
            .itemCodeEqualTo(itemCode)
            .count();

        if (count > 0) continue;

        await isar.writeTxn(
          () async {
            await isar.statModels.put(statModel);
          },
        );
      }
    }

    return stats;
  }
}
