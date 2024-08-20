import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CodeFactoryWidget(),
    );
  }
}

// 생성자 생성 후 빌드가 실행됨.
// 원래 두번 빌드됨. 첫번째는 초기화, 두번째는 플러터 빌드
class CodeFactoryWidget extends StatelessWidget {
  const CodeFactoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}
  