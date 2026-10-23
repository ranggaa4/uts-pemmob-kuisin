import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:kuisin/models/question.dart';
import 'package:kuisin/providers/quiz_provider.dart';

const soalContoh = [
  Question(text: '1 + 1', options: ['1', '2', '3'], correctIndex: 1),
  Question(text: '2 + 2', options: ['3', '4', '5'], correctIndex: 1),
  Question(text: '3 + 3', options: ['6', '7', '8'], correctIndex: 0),
];

QuizProvider buatProvider() => QuizProvider(bankSoal: soalContoh, acak: false);

void main() {
  test('semua jawaban benar menghasilkan nilai 100', () {
    final p = buatProvider()..mulai('Budi');

    for (int i = 0; i < p.totalSoal; i++) {
      p.pilihJawaban(p.soalSekarang.correctIndex);
      p.lanjut();
    }

    expect(p.selesai, true);
    expect(p.skor, 3);
    expect(p.nilai, 100);
  });

  test('skor dihitung dari jawaban yang benar saja', () {
    final p = buatProvider()..mulai('Budi');

    p.pilihJawaban(1); 
    p.lanjut();
    p.pilihJawaban(0); 
    p.lanjut();
    p.pilihJawaban(2); 
    p.lanjut();

    expect(p.skor, 1);
    expect(p.nilai, 33);
  });

  test('tidak bisa lanjut kalau belum menjawab', () {
    final p = buatProvider()..mulai('Budi');

    p.lanjut();

    expect(p.nomor, 0);
  });

  test('tombol sebelumnya mempertahankan jawaban', () {
    final p = buatProvider()..mulai('Budi');

    p.pilihJawaban(2);
    p.lanjut();
    expect(p.nomor, 1);

    p.sebelumnya();
    expect(p.nomor, 0);
    expect(p.jawabanSekarang, 2);
  });

  test('nama sama melanjutkan progres, nama beda mulai dari awal', () {
    final p = buatProvider()..mulai('Budi');
    p.pilihJawaban(1);
    p.lanjut();

    p.mulai('Budi');
    expect(p.nomor, 1);

    p.mulai('Ani');
    expect(p.nomor, 0);
    expect(p.sudahAdaProgres, false);
  });

  test('acak pilihan tetap menjaga jawaban yang benar', () {
    for (int seed = 0; seed < 20; seed++) {
      for (final soal in soalContoh) {
        final hasil = soal.acak(Random(seed));
        expect(
          hasil.options[hasil.correctIndex],
          soal.options[soal.correctIndex],
        );
      }
    }
  });
}
