import 'package:flutter/foundation.dart';

import '../data/dummy_questions.dart';
import '../models/question.dart';

// menyimpan semua progres kuis supaya tidak hilang
// saat layar dirotasi atau pindah halaman
class QuizProvider extends ChangeNotifier {
  String _nama = '';
  int _nomor = 0;
  bool _selesai = false;
  final List<int?> _jawaban = List.filled(dummyQuestions.length, null);

  String get nama => _nama;
  int get nomor => _nomor;
  int get totalSoal => dummyQuestions.length;
  bool get selesai => _selesai;
  Question get soalSekarang => dummyQuestions[_nomor];
  int? get jawabanSekarang => _jawaban[_nomor];
  bool get sudahMenjawab => _jawaban[_nomor] != null;
  bool get soalTerakhir => _nomor == totalSoal - 1;

  int get skor {
    int benar = 0;
    for (int i = 0; i < totalSoal; i++) {
      if (_jawaban[i] == dummyQuestions[i].correctIndex) benar++;
    }
    return benar;
  }

  int get nilai => (skor * 100 / totalSoal).round();

  // dipanggil dari halaman home. Kalau nama sama dan kuis belum selesai,
  // progres sebelumnya dilanjutkan, selain itu mulai dari awal
  void mulai(String nama) {
    if (nama != _nama || _selesai) {
      _kosongkan();
    }
    _nama = nama;
    notifyListeners();
  }

  void pilihJawaban(int index) {
    _jawaban[_nomor] = index;
    notifyListeners();
  }

  void lanjut() {
    if (!sudahMenjawab) return;

    if (soalTerakhir) {
      _selesai = true;
    } else {
      _nomor++;
    }
    notifyListeners();
  }

  void ulangi() {
    _kosongkan();
    notifyListeners();
  }

  void _kosongkan() {
    _nomor = 0;
    _selesai = false;
    _jawaban.fillRange(0, _jawaban.length, null);
  }
}
