import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/hasil_kuis.dart';


class ScoreStorage {
  static const _kunci = 'riwayat_hasil';

  Future<List<HasilKuis>> ambilSemua() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_kunci) ?? [];
    return data
        .map((e) => HasilKuis.fromJson(jsonDecode(e) as Map<String, dynamic>))
        .toList();
  }

  Future<List<HasilKuis>> ambilTerbaik({int batas = 10}) async {
    final semua = await ambilSemua();
    semua.sort((a, b) {
      final banding = b.nilai.compareTo(a.nilai);
      return banding != 0 ? banding : b.waktu.compareTo(a.waktu);
    });
    return semua.take(batas).toList();
  }

  Future<void> tambah(HasilKuis hasil) async {
    final prefs = await SharedPreferences.getInstance();
    final data = [...?prefs.getStringList(_kunci)];
    data.add(jsonEncode(hasil.toJson()));
    await prefs.setStringList(_kunci, data);
  }
}
