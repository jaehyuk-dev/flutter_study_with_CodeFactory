import 'package:dusty_dust/const/color.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class CategoryStat extends StatelessWidget {
  final Region region;
  final Color darkColor;
  final Color lightColor;
  const CategoryStat({
    super.key,
    required this.region,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: LayoutBuilder(builder: (contextj, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: dartColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "제목별 통계",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const PageScrollPhysics(),
                      children: ItemCode.values
                          .map(
                            (e) => FutureBuilder(
                                future: GetIt.I<Isar>()
                                    .statModels
                                    .filter()
                                    .regionEqualTo(region)
                                    .itemCodeEqualTo(e)
                                    .sortByDataTime()
                                    .findFirst(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    debugPrint(snapshot.error.toString());
                                    return const Center(
                                      child: Text("오류 발생"),
                                    );
                                  }

                                  if (!snapshot.hasData) {
                                    return const Center(
                                        child: Text("데이터가 없습니다."));
                                  }
                                  final statModel = snapshot.data!;
                                  final statusModel =
                                      StatusUtils.getStatusModelFromStat(
                                          statModel: statModel);

                                  return SizedBox(
                                    width: constraint.maxWidth / 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(e.krName),
                                        const SizedBox(height: 8),
                                        Image.asset(
                                          statusModel.imagePath,
                                          width: 50,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(statModel.stat.toString()),
                                      ],
                                    ),
                                  );
                                }),
                          )
                          .toList(),
                      // List.generate(
                      //   12,
                      //   (index) => SizedBox(
                      //     width: constraint.maxWidth / 3,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text("test$index"),
                      //         const SizedBox(height: 8),
                      //         Image.asset(
                      //           'asset/img/bad.png',
                      //           width: 50,
                      //         ),
                      //         const SizedBox(height: 8),
                      //         Text((index * index).toString()),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
