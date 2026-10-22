import 'package:flutter/material.dart';

import '../models/hasil_kuis.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';


class RiwayatTile extends StatelessWidget {
  final int peringkat;
  final HasilKuis hasil;

  const RiwayatTile({
    super.key,
    required this.peringkat,
    required this.hasil,
  });

  @override
  Widget build(BuildContext context) {
    final u = context.unit;
    final w = context.warna;
    final t = hasil.waktu;

    return Container(
      margin: EdgeInsets.only(bottom: u * 0.03),
      padding: EdgeInsets.all(u * 0.04),
      decoration: BoxDecoration(
        color: w.surface,
        borderRadius: BorderRadius.circular(u * 0.035),
        border: Border.all(color: w.outline),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: u * 0.045,
            backgroundColor: peringkat == 1 ? w.accent : w.background,
            child: Text(
              '$peringkat',
              style: TextStyle(
                fontSize: u * 0.038,
                fontWeight: FontWeight.w700,
                color: peringkat == 1 ? w.onAccent : w.textPrimary,
              ),
            ),
          ),
          SizedBox(width: u * 0.035),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasil.nama,
                  style: TextStyle(
                    fontSize: u * 0.04,
                    fontWeight: FontWeight.w600,
                    color: w.textPrimary,
                  ),
                ),
                Text(
                  '${t.day}/${t.month}/${t.year}',
                  style: TextStyle(fontSize: u * 0.03, color: w.textMuted),
                ),
              ],
            ),
          ),
          Text(
            '${hasil.skor}/${hasil.total}',
            style: TextStyle(
              fontSize: u * 0.045,
              fontWeight: FontWeight.w700,
              color: w.judul,
            ),
          ),
        ],
      ),
    );
  }
}
