import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _Top(
                  selectedDate: selectedDate,
                  onPressed: onHeartPressed,
                ),
                const _Bottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onHeartPressed() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              maximumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }
}

class _Top extends StatefulWidget {
  DateTime selectedDate;
  VoidCallback onPressed;
  _Top({
    super.key,
    required this.selectedDate,
    required this.onPressed,
  });

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Text(
            "U&I",
            style: textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "우리 처음 만난 날",
            style: textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${widget.selectedDate.year}.${widget.selectedDate.month}.${widget.selectedDate.day}",
            style: textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            iconSize: 60,
            color: Colors.red,
            onPressed: widget.onPressed,
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "D+${now.difference(widget.selectedDate).inDays + 1}",
            style: textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "asset/img/middle_image.png",
      ),
    );
  }
}
