import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/quiz_progress_bar.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final lebar = MediaQuery.sizeOf(context).width;
    final base = lebar > 600 ? 600.0 : lebar;
    final soal = quiz.soalSekarang;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Halo, ${quiz.nama}',
          style: TextStyle(
            fontSize: base * 0.045,
            fontWeight: FontWeight.w700,
            color: AppColors.indigo,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(base * 0.06),
                    children: [
                      QuizProgressBar(
                        current: quiz.nomor + 1,
                        total: quiz.totalSoal,
                      ),
                      SizedBox(height: base * 0.05),
                      Text(
                        soal.text,
                        style: TextStyle(
                          fontSize: base * 0.05,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                        ),
                      ),
                      SizedBox(height: base * 0.06),
                      for (int i = 0; i < soal.options.length; i++)
                        OptionTile(
                          huruf: String.fromCharCode(65 + i),
                          label: soal.options[i],
                          selected: quiz.jawabanSekarang == i,
                          onTap: () => context.read<QuizProvider>().pilihJawaban(i),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    base * 0.06,
                    0,
                    base * 0.06,
                    base * 0.05,
                  ),
                  child: PrimaryButton(
                    label: quiz.soalTerakhir ? 'Selesai' : 'Lanjut',
                    onPressed: quiz.sudahMenjawab
                        ? () {
                            final terakhir = quiz.soalTerakhir;
                            context.read<QuizProvider>().lanjut();
                            if (terakhir) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ResultScreen(),
                                ),
                              );
                            }
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
