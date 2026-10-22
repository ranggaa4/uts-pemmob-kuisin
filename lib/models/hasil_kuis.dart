class HasilKuis {
  final String nama;
  final int skor;
  final int total;
  final DateTime waktu;

  const HasilKuis({
    required this.nama,
    required this.skor,
    required this.total,
    required this.waktu,
  });

  int get nilai => (skor * 100 / total).round();

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'skor': skor,
        'total': total,
        'waktu': waktu.toIso8601String(),
      };

  factory HasilKuis.fromJson(Map<String, dynamic> json) {
    return HasilKuis(
      nama: json['nama'] as String,
      skor: json['skor'] as int,
      total: json['total'] as int,
      waktu: DateTime.parse(json['waktu'] as String),
    );
  }
}
