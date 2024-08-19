import 'package:flutter/material.dart';
import 'package:web_view/screen/home_screen.dart';

void main() {
  /// 플러터 프레임워크가 실행될때까지 기다린다
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
