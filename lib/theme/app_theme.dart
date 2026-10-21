import 'package:flutter/material.dart';

import 'app_colors.dart';


@immutable
class KuisinColors extends ThemeExtension<KuisinColors> {
  final Color background;
  final Color surface;
  final Color primary;
  final Color onPrimary;
  final Color accent;
  final Color onAccent;
  final Color judul;
  final Color textPrimary;
  final Color textMuted;
  final Color outline;
  final Color sukses;
  final Color gagal;
  final Color decoAtas;
  final Color decoBawah;

  const KuisinColors({
    required this.background,
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.onAccent,
    required this.judul,
    required this.textPrimary,
    required this.textMuted,
    required this.outline,
    required this.sukses,
    required this.gagal,
    required this.decoAtas,
    required this.decoBawah,
  });

  static const light = KuisinColors(
    background: AppColors.cream,
    surface: Colors.white,
    primary: AppColors.indigo,
    onPrimary: Colors.white,
    accent: AppColors.amber,
    onAccent: AppColors.ink,
    judul: AppColors.indigo,
    textPrimary: AppColors.ink,
    textMuted: Color(0xFF6A6880),
    outline: Color(0x263A3680),
    sukses: Color(0xFF2E9E6B),
    gagal: Color(0xFFD9534F),
    decoAtas: AppColors.amber,
    decoBawah: Color(0x1F3A3680),
  );

  static const dark = KuisinColors(
    background: AppColors.malam,
    surface: AppColors.malamKartu,
    primary: AppColors.ungu,
    onPrimary: Colors.white,
    accent: AppColors.amber,
    onAccent: AppColors.ink,
    judul: AppColors.lavender,
    textPrimary: Color(0xFFF2F0FF),
    textMuted: Color(0xFFB5B2CC),
    outline: Color(0x33FFFFFF),
    sukses: Color(0xFF4CC38A),
    gagal: Color(0xFFFF7B72),
    decoAtas: Color(0x59FFB627),
    decoBawah: Color(0x336E69D6),
  );

  @override
  KuisinColors copyWith({
    Color? background,
    Color? surface,
    Color? primary,
    Color? onPrimary,
    Color? accent,
    Color? onAccent,
    Color? judul,
    Color? textPrimary,
    Color? textMuted,
    Color? outline,
    Color? sukses,
    Color? gagal,
    Color? decoAtas,
    Color? decoBawah,
  }) {
    return KuisinColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      judul: judul ?? this.judul,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      outline: outline ?? this.outline,
      sukses: sukses ?? this.sukses,
      gagal: gagal ?? this.gagal,
      decoAtas: decoAtas ?? this.decoAtas,
      decoBawah: decoBawah ?? this.decoBawah,
    );
  }

  @override
  KuisinColors lerp(ThemeExtension<KuisinColors>? other, double t) {
    if (other is! KuisinColors) return this;
    return t < 0.5 ? this : other;
  }
}


extension WarnaContext on BuildContext {
  KuisinColors get warna => Theme.of(this).extension<KuisinColors>()!;
}

class AppTheme {
  static final ThemeData light = _buat(Brightness.light, KuisinColors.light);
  static final ThemeData dark = _buat(Brightness.dark, KuisinColors.dark);

  static ThemeData _buat(Brightness brightness, KuisinColors c) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: brightness,
      scaffoldBackgroundColor: c.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.indigo,
        brightness: brightness,
        primary: c.primary,
        secondary: c.accent,
        surface: c.surface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: c.judul),
      ),
      extensions: [c],
    );
  }
}
