import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import '../models/hasil_kuis.dart';
import '../models/question.dart';
import '../services/score_storage.dart';



class QuizProvider extends ChangeNotifier {
  final List<Question> bankSoal;
  final ScoreStorage? storage;
  final bool acak;
  final Random _rnd;

  QuizProvider({
    required this.bankSoal,
    this.storage,
    this.acak = true,
    Random? random,
  }) : _rnd = random ?? Random() {
    _siapkanSoal();
  }

  String _nama = '';
  int _nomor = 0;
  bool _selesai = false;
  late List<Question> _soal;
  late List<int?> _jawaban;

  String get nama => _nama;
  int get nomor => _nomor;
  int get totalSoal => _soal.length;
  bool get selesai => _selesai;
  List<Question> get soalSemua => List.unmodifiable(_soal);
  List<int?> get jawaban => List.unmodifiable(_jawaban);
  Question get soalSekarang => _soal[_nomor];
  int? get jawabanSekarang => _jawaban[_nomor];
  bool get sudahMenjawab => _jawaban[_nomor] != null;
  bool get soalTerakhir => _nomor == totalSoal - 1;
  bool get bisaMundur => _nomor > 0;
  bool get sudahAdaProgres => _nomor > 0 || _jawaban.any((j) => j != null);

  int get skor {
    int benar = 0;
    for (int i = 0; i < totalSoal; i++) {
      if (_jawaban[i] == _soal[i].correctIndex) benar++;
    }
    return benar;
  }

  int get nilai => (skor * 100 / totalSoal).round();

  
  
  void mulai(String nama) {
    if (nama != _nama || _selesai) {
      _siapkanSoal();
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
      unawaited(_simpanSkor());
    } else {
      _nomor++;
    }
    notifyListeners();
  }

  void sebelumnya() {
    if (!bisaMundur) return;
    _nomor--;
    notifyListeners();
  }

  void ulangi() {
    _siapkanSoal();
    notifyListeners();
  }

  void _siapkanSoal() {
    if (acak) {
      final urutan = List.of(bankSoal)..shuffle(_rnd);
      _soal = urutan.map((q) => q.acak(_rnd)).toList();
    } else {
      _soal = List.of(bankSoal);
    }
    _jawaban = List.filled(_soal.length, null);
    _nomor = 0;
    _selesai = false;
  }

  Future<void> _simpanSkor() async {
    await storage?.tambah(
      HasilKuis(
        nama: _nama,
        skor: skor,
        total: totalSoal,
        waktu: DateTime.now(),
      ),
    );
  }
}
