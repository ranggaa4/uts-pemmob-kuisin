import 'package:flutter/material.dart';


class DecoCircle extends StatelessWidget {
  final double ukuran;
  final Color warna;

  const DecoCircle({super.key, required this.ukuran, required this.warna});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ukuran,
      height: ukuran,
      decoration: BoxDecoration(color: warna, shape: BoxShape.circle),
    );
  }
}
