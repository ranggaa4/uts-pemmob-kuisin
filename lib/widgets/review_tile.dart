import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';


class ReviewTile extends StatelessWidget {
  final int nomor;
  final String pertanyaan;
  final String? jawabanUser;
  final String jawabanBenar;
  final bool benar;

  const ReviewTile({
    super.key,
    required this.nomor,
    required this.pertanyaan,
    required this.jawabanUser,
    required this.jawabanBenar,
    required this.benar,
  });

  @override
  Widget build(BuildContext context) {
    final u = context.unit;
    final w = context.warna;
    final warnaStatus = benar ? w.sukses : w.gagal;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: u * 0.03),
      padding: EdgeInsets.all(u * 0.04),
      decoration: BoxDecoration(
        color: w.surface,
        borderRadius: BorderRadius.circular(u * 0.035),
        border: Border.all(color: warnaStatus.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            benar ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: warnaStatus,
            size: u * 0.07,
          ),
          SizedBox(width: u * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nomor. $pertanyaan',
                  style: TextStyle(
                    fontSize: u * 0.036,
                    fontWeight: FontWeight.w600,
                    color: w.textPrimary,
                  ),
                ),
                SizedBox(height: u * 0.015),
                Text(
                  'Jawabanmu: ${jawabanUser ?? '-'}',
                  style: TextStyle(fontSize: u * 0.033, color: warnaStatus),
                ),
                if (!benar)
                  Text(
                    'Jawaban benar: $jawabanBenar',
                    style: TextStyle(fontSize: u * 0.033, color: w.sukses),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
