import 'package:dusty_dust/const/color.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class HourlyStat extends StatelessWidget {
  final Region region;
  final Color darkColor;
  final Color lightColor;
  const HourlyStat({
    super.key,
    required this.region,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: ItemCode.values
            .map(
              (e) => FutureBuilder<List<StatModel>>(
                future: GetIt.I<Isar>()
                    .statModels
                    .filter()
                    .regionEqualTo(region)
                    .itemCodeEqualTo(e)
                    .sortByDataTime()
                    .limit(24)
                    .findAll(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("데이터가 없습니다."),
                    );
                  }

                  final stats = snapshot.data!;

                  return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        color: lightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: dartColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                  )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "시간별 ${e.krName}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            ...stats.map(
                              (e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          '${e.dataTime.hour.toString().padLeft(2, '0')}시'),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        StatusUtils.getStatusModelFromStat(
                                                statModel: e)
                                            .imagePath,
                                        height: 20,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        StatusUtils.getStatusModelFromStat(
                                                statModel: e)
                                            .label,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            .toList());
  }
}
