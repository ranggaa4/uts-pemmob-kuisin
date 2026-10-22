import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class QuizProgressBar extends StatelessWidget {
  final int current; 
  final int total;

  const QuizProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final u = context.unit;
    final w = context.warna;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soal $current dari $total',
          style: TextStyle(fontSize: u * 0.035, color: w.textMuted),
        ),
        SizedBox(height: u * 0.02),
        ClipRRect(
          borderRadius: BorderRadius.circular(u * 0.02),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: u * 0.022,
            color: w.accent,
            backgroundColor: w.outline,
          ),
        ),
      ],
    );
  }
}
