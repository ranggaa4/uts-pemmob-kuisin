import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/quiz_progress_bar.dart';
import '../widgets/secondary_button.dart';
import '../widgets/theme_toggle_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  Future<bool?> _konfirmasiKeluar(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar dari kuis?'),
        content: const Text(
          'Progresmu tetap tersimpan. Kalau masuk lagi dengan nama yang sama, '
          'kamu bisa lanjut dari soal terakhir.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final u = context.unit;
    final w = context.warna;
    final soal = quiz.soalSekarang;

    final bagianSoal = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizProgressBar(current: quiz.nomor + 1, total: quiz.totalSoal),
        SizedBox(height: u * 0.05),
        Text(
          soal.text,
          style: TextStyle(
            fontSize: u * 0.05,
            fontWeight: FontWeight.w700,
            color: w.textPrimary,
          ),
        ),
      ],
    );

    final bagianJawaban = Column(
      children: [
        for (int i = 0; i < soal.options.length; i++)
          OptionTile(
            huruf: String.fromCharCode(65 + i),
            label: soal.options[i],
            selected: quiz.jawabanSekarang == i,
            onTap: () => context.read<QuizProvider>().pilihJawaban(i),
          ),
      ],
    );

    
    final isiSoal = context.isWide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: bagianSoal),
              SizedBox(width: u * 0.08),
              Expanded(child: bagianJawaban),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bagianSoal,
              SizedBox(height: u * 0.06),
              bagianJawaban,
            ],
          );

    return PopScope(
      canPop: !quiz.sudahAdaProgres,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final keluar = await _konfirmasiKeluar(context);
        if (keluar == true && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Halo, ${quiz.nama}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: u * 0.045,
              fontWeight: FontWeight.w700,
              color: w.judul,
            ),
          ),
          actions: const [ThemeToggleButton()],
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.lebarKonten),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(u * 0.06),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, animasi) => FadeTransition(
                          opacity: animasi,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.05, 0),
                              end: Offset.zero,
                            ).animate(animasi),
                            child: child,
                          ),
                        ),
                        child: KeyedSubtree(
                          key: ValueKey(quiz.nomor),
                          child: SizedBox(
                            width: double.infinity,
                            child: isiSoal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(u * 0.06, 0, u * 0.06, u * 0.05),
                    child: Row(
                      children: [
                        if (quiz.bisaMundur) ...[
                          Expanded(
                            flex: 2,
                            child: SecondaryButton(
                              label: 'Sebelumnya',
                              onPressed: () =>
                                  context.read<QuizProvider>().sebelumnya(),
                            ),
                          ),
                          SizedBox(width: u * 0.03),
                        ],
                        Expanded(
                          flex: 3,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
