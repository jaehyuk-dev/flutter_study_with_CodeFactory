import 'package:dusty_dust/const/color.dart';
import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utils/date_utils.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class MainStat extends StatelessWidget {
  final Region region;
  final Color primaryColor;
  final bool isExpanded;
  const MainStat({
    super.key,
    required this.region,
    required this.primaryColor,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
      color: Colors.white,
      fontSize: 40,
    );

    return SliverAppBar(
      expandedHeight: 500,
      backgroundColor: primaryColor,
      pinned: true,
      title: isExpanded ? null : Text(region.krName),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: FutureBuilder<StatModel?>(
              future: GetIt.I<Isar>()
                  .statModels
                  .filter()
                  .regionEqualTo(Region.seoul)
                  .itemCodeEqualTo(ItemCode.PM10)
                  .sortByDataTimeDesc()
                  .findFirst(),
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
                final statModel = snapshot.data!;

                final status =
                    StatusUtils.getStatusModelFromStat(statModel: statModel);

                return Column(
                  children: [
                    Text("서울", style: ts.copyWith(fontWeight: FontWeight.w700)),
                    Text(
                        DateUtils.dateTimeToString(
                            dateTime: statModel.dataTime),
                        style: ts.copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      status.imagePath,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(status.label,
                        style: ts.copyWith(fontWeight: FontWeight.w700)),
                    Text(status.comment,
                        style: ts.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
