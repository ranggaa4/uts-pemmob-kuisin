import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _pesan(int nilai) {
    if (nilai >= 80) return 'Mantap, kamu jago banget!';
    if (nilai >= 60) return 'Lumayan, tinggal sedikit lagi.';
    return 'Belum maksimal, coba sekali lagi yuk.';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final lebar = MediaQuery.sizeOf(context).width;
    final base = lebar > 600 ? 600.0 : lebar;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: base * 0.08),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: base * 0.13,
                    backgroundColor: AppColors.amber,
                    child: Icon(
                      Icons.emoji_events_rounded,
                      size: base * 0.15,
                      color: AppColors.indigo,
                    ),
                  ),
                  SizedBox(height: base * 0.06),
                  Text(
                    'Kuis selesai!',
                    style: TextStyle(
                      fontSize: base * 0.07,
                      fontWeight: FontWeight.w700,
                      color: AppColors.indigo,
                    ),
                  ),
                  Text(
                    'Skor akhir ${quiz.nama}',
                    style: TextStyle(
                      fontSize: base * 0.04,
                      color: AppColors.ink.withValues(alpha: 0.7),
                    ),
                  ),
                  SizedBox(height: base * 0.05),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: base * 0.06),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(base * 0.05),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.indigo.withValues(alpha: 0.1),
                          blurRadius: base * 0.05,
                          offset: Offset(0, base * 0.015),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${quiz.skor}/${quiz.totalSoal}',
                          style: TextStyle(
                            fontSize: base * 0.16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.indigo,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'Nilai ${quiz.nilai}',
                          style: TextStyle(
                            fontSize: base * 0.045,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ink,
                          ),
                        ),
                        SizedBox(height: base * 0.02),
                        Text(
                          _pesan(quiz.nilai),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: base * 0.038,
                            color: AppColors.ink.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: base * 0.07),
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
                  SizedBox(height: base * 0.03),
                  TextButton(
                    onPressed: () =>
                        Navigator.popUntil(context, (route) => route.isFirst),
                    child: Text(
                      'Kembali ke Beranda',
                      style: TextStyle(
                        fontSize: base * 0.038,
                        color: AppColors.indigo,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
