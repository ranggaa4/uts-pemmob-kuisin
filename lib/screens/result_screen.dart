import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/primary_button.dart';
import '../widgets/review_tile.dart';
import '../widgets/secondary_button.dart';
import 'quiz_screen.dart';
import 'riwayat_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _pesan(int nilai) {
    if (nilai >= 80) return 'Mantap, kamu jago banget!';
    if (nilai >= 60) return 'Lumayan, tinggal sedikit lagi.';
    return 'Belum maksimal, coba sekali lagi yuk.';
  }

  @override
  Widget build(BuildContext context) {
    
    final quiz = context.read<QuizProvider>();
    final u = context.unit;
    final w = context.warna;
    final soalSemua = quiz.soalSemua;
    final jawaban = quiz.jawaban;

    final ringkasan = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: u * 0.13,
          backgroundColor: w.accent,
          child: Icon(
            Icons.emoji_events_rounded,
            size: u * 0.15,
            color: w.onAccent,
          ),
        ),
        SizedBox(height: u * 0.06),
        Text(
          'Kuis selesai!',
          style: TextStyle(
            fontSize: u * 0.07,
            fontWeight: FontWeight.w700,
            color: w.judul,
          ),
        ),
        Text(
          'Skor akhir ${quiz.nama}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: u * 0.04, color: w.textMuted),
        ),
        SizedBox(height: u * 0.05),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: u * 0.06),
          decoration: BoxDecoration(
            color: w.surface,
            borderRadius: BorderRadius.circular(u * 0.05),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: u * 0.05,
                offset: Offset(0, u * 0.015),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                '${quiz.skor}/${quiz.totalSoal}',
                style: TextStyle(
                  fontSize: u * 0.16,
                  fontWeight: FontWeight.w700,
                  color: w.judul,
                  height: 1.1,
                ),
              ),
              Text(
                'Nilai ${quiz.nilai}',
                style: TextStyle(
                  fontSize: u * 0.045,
                  fontWeight: FontWeight.w500,
                  color: w.textPrimary,
                ),
              ),
              SizedBox(height: u * 0.02),
              Text(
                _pesan(quiz.nilai),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: u * 0.038, color: w.textMuted),
              ),
            ],
          ),
        ),
        SizedBox(height: u * 0.07),
        PrimaryButton(
          label: 'Main Lagi',
          onPressed: () {
            context.read<QuizProvider>().ulangi();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const QuizScreen()),
            );
          },
        ),
        SizedBox(height: u * 0.03),
        SecondaryButton(
          label: 'Kembali ke Beranda',
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RiwayatScreen()),
          ),
          child: Text(
            'Lihat skor tertinggi',
            style: TextStyle(fontSize: u * 0.036, color: w.judul),
          ),
        ),
      ],
    );

    final review = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review jawaban',
          style: TextStyle(
            fontSize: u * 0.05,
            fontWeight: FontWeight.w700,
            color: w.textPrimary,
          ),
        ),
        SizedBox(height: u * 0.03),
        for (int i = 0; i < soalSemua.length; i++)
          ReviewTile(
            nomor: i + 1,
            pertanyaan: soalSemua[i].text,
            jawabanUser: jawaban[i] == null
                ? null
                : soalSemua[i].options[jawaban[i]!],
            jawabanBenar: soalSemua[i].options[soalSemua[i].correctIndex],
            benar: jawaban[i] == soalSemua[i].correctIndex,
          ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: u * 0.08, vertical: u * 0.06),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.lebarKonten),
              child: context.isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: ringkasan),
                        SizedBox(width: u * 0.08),
                        Expanded(child: review),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ringkasan,
                        SizedBox(height: u * 0.08),
                        review,
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
