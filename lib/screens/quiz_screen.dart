import 'package:flutter/material.dart';

import '../data/dummy_questions.dart';
import '../theme/app_colors.dart';
import '../widgets/option_tile.dart';

class QuizScreen extends StatefulWidget {
  final String nama;

  const QuizScreen({super.key, required this.nama});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // sementara baru tampil soal pertama
  final int _nomor = 0;
  int? _dipilih;

  // TODO: tombol lanjut, pindah soal, hitung skor, halaman hasil
  // TODO: simpan progres jawaban (state management) biar aman waktu rotasi

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.sizeOf(context).width;
    final base = lebar > 600 ? 600.0 : lebar;
    final soal = dummyQuestions[_nomor];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Halo, ${widget.nama}',
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
            child: ListView(
              padding: EdgeInsets.all(base * 0.06),
              children: [
                Text(
                  'Soal ${_nomor + 1} dari ${dummyQuestions.length}',
                  style: TextStyle(
                    fontSize: base * 0.035,
                    color: AppColors.ink.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: base * 0.025),
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
                    selected: _dipilih == i,
                    onTap: () => setState(() => _dipilih = i),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
