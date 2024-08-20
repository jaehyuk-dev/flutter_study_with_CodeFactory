import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (show)
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = color == Colors.red ? Colors.blue : Colors.red;
                  });
                },
                child: CodeFactoryWidget(
                  color: color,
                ),
              ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                // setState 밖/안 차이? 크게 차이는 실행상 없음
                setState(() {
                  // 하지만 명시적으로 보여줄 수 있음. 권장되는 방법
                  show = !show;
                });
              },
              child: const Text(
                "클릭",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CodeFactoryWidget extends StatefulWidget {
  final Color color;

  CodeFactoryWidget({
    super.key,
    required this.color,
  }) {
    debugPrint("1) Stateful Widget Constructor");
  }

  @override
  State<CodeFactoryWidget> createState() {
    debugPrint("2) Stateful Widget Create State");
    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {
  @override
  void initState() {
    debugPrint("3) Stateful Widget initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint("4) Stateful Widget didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("5) Stateful Widget build");
    return Container(
      color: widget.color,
      width: 50,
      height: 50,
    );
  }

  @override
  void deactivate() {
    debugPrint("6) Stateful Widget deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("7) Stateful Widget dispose");
    super.dispose();
  }
}
