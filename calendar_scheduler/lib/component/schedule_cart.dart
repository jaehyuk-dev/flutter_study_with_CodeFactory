import 'package:calendar_scheduler/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleCart extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;
  const ScheduleCart({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    "${startTime.toString().padLeft(2, "0")}:00",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${endTime.toString().padLeft(2, "0")}:00",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: Text(content)),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
