import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class QuizProgressBar extends StatelessWidget {
  final int current; // nomor soal sekarang (mulai dari 1)
  final int total;

  const QuizProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.sizeOf(context).width;
    final base = lebar > 600 ? 600.0 : lebar;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soal $current dari $total',
          style: TextStyle(
            fontSize: base * 0.035,
            color: AppColors.ink.withValues(alpha: 0.6),
          ),
        ),
        SizedBox(height: base * 0.02),
        ClipRRect(
          borderRadius: BorderRadius.circular(base * 0.02),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: base * 0.022,
            color: AppColors.amber,
            backgroundColor: AppColors.indigo.withValues(alpha: 0.12),
          ),
        ),
      ],
    );
  }
}
