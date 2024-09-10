import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/database/drift.dart';
import 'package:calendar_scheduler/model/schedule.dart';
import 'package:calendar_scheduler/model/schedule_with_category.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDay;
  final int? id;
  const ScheduleBottomSheet({
    super.key,
    required this.selectedDay,
    this.id,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  int? selectedColorId;

  initCategory() async {
    print("위젯.아이디: ${widget.id}");
    print("위젯.아이디: ${widget.id == null}");
    if (widget.id != null) {
      final resp = await GetIt.I<AppDatabase>().getScheduleById(widget.id!);
      setState(() {
        selectedColorId = resp.category.id;
      });
    } else {
      final resp = await GetIt.I<AppDatabase>().getCategories();
      setState(() {
        selectedColorId = resp.first.id;
      });
    }
  }

  @override
  void initState() {
    initCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedColorId == null) {
      return const SizedBox.shrink();
    }
    return FutureBuilder<ScheduleWithCategory>(
      future: widget.id == null
          ? null
          : GetIt.I<AppDatabase>().getScheduleById(widget.id!),
      builder: (context, snapshot) {
        if (widget.id != null &&
            snapshot.connectionState == ConnectionState.waiting &&
            !snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = snapshot.data?.schedule;
        return Builder(
          builder: (context) {
            return Container(
              color: Colors.white,
              height: 600,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _Time(
                          onStartSaved: onStartTimeSaved,
                          onStartValidate: onStartTimeValidate,
                          onEndSaved: onEndTimeSaved,
                          onEndValidate: onEndTimeValidate,
                          startTimeInitValue: data?.startTime.toString(),
                          endTimeInitValue: data?.endTime.toString(),
                        ),
                        const SizedBox(height: 8),
                        _Content(
                          onSaved: onContentSaved,
                          onValidate: onContentValidate,
                          initalValue: data?.content.toString(),
                        ),
                        const SizedBox(height: 8),
                        _Category(
                          selectedColor: selectedColorId!,
                          onTap: (int color) {
                            setState(
                              () {
                                selectedColorId = color;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        _SaveButton(onPressed: onSavePressed),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void onStartTimeSaved(String? val) {
    if (val == null) {
      return;
    }
    startTime = int.parse(val);
  }

  String? onStartTimeValidate(String? val) {
    if (val == null) {
      return '값을 입력 해주세요!';
    }

    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요!';
    }

    final time = int.parse(val);

    if (time > 24 || time < 0) {
      return '0과 24 사이의 숫자를 입력해주세요!';
    }

    return null;
  }

  void onEndTimeSaved(String? val) {
    if (val == null) {
      return;
    }

    endTime = int.parse(val);
  }

  String? onEndTimeValidate(String? val) {
    if (val == null) {
      return '값을 입력 해주세요!';
    }

    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요!';
    }

    final time = int.parse(val);

    if (time > 24 || time < 0) {
      return '0과 24 사이의 숫자를 입력해주세요!';
    }

    return null;
  }

  void onContentSaved(String? val) {
    if (val == null) {
      return;
    }

    content = val;
  }

  String? onContentValidate(String? val) {
    if (val == null) {
      return '내용을 입력해주세요!';
    }

    if (val.length < 5) {
      return '5자 이상을 입력해주세요!';
    }

    return null;
  }

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final database = GetIt.I<AppDatabase>();

      if (widget.id == null) {
        await database.createSchedule(
          ScheduleTableCompanion(
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            content: Value(content!),
            colorId: Value(selectedColorId!),
            date: Value(widget.selectedDay),
          ),
        );
      } else {
        await database.updateScheduleById(
          widget.id!,
          ScheduleTableCompanion(
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            content: Value(content!),
            colorId: Value(selectedColorId!),
            date: Value(widget.selectedDay),
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final FormFieldValidator<String> onStartValidate;
  final FormFieldValidator<String> onEndValidate;
  final String? startTimeInitValue;
  final String? endTimeInitValue;

  final GlobalKey<FormState> formKey = GlobalKey();

  _Time({
    required this.onStartSaved,
    required this.onEndSaved,
    required this.onStartValidate,
    required this.onEndValidate,
    this.startTimeInitValue,
    this.endTimeInitValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            lable: "시작 시간",
            onSaved: onStartSaved,
            validator: onStartValidate,
            initalValue: startTimeInitValue,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomTextField(
            lable: "마감 시간",
            onSaved: onEndSaved,
            validator: onEndValidate,
            initalValue: endTimeInitValue,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> onValidate;
  final String? initalValue;

  const _Content({
    required this.onSaved,
    required this.onValidate,
    this.initalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        lable: "내용",
        expand: true,
        onSaved: onSaved,
        validator: onValidate,
        initalValue: initalValue,
      ),
    );
  }
}

typedef OnColorSelected = void Function(int color);

class _Category extends StatelessWidget {
  final int selectedColor;
  final OnColorSelected onTap;

  const _Category({
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetIt.I<AppDatabase>().getCategories(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }
          return Row(
            children: snapshot.data!
                .map((e) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {
                          onTap(e.id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse('FF${e.color}', radix: 16),
                            ),
                            border: e.id == selectedColor
                                ? Border.all(
                                    color: Colors.black,
                                    width: 4,
                                  )
                                : null,
                            shape: BoxShape.circle,
                          ),
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ))
                .toList(),
          );
        });
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            onPressed: onPressed,
            child: const Text("저장"),
          ),
        ),
      ],
    );
  }
}
