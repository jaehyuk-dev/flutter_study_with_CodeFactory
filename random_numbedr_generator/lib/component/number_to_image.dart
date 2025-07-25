import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  final int number;

  const NumberToImage({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split("")
          .map(
            (number) => Image.asset(
              'asset/img/$number.png',
              width: 60,
              height: 100,
            ),
          )
          .toList(),
    );
  }
}
