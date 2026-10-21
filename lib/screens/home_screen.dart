import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/deco_circle.dart';
import '../widgets/primary_button.dart';
import '../widgets/theme_toggle_button.dart';
import 'quiz_screen.dart';
import 'riwayat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _namaController = TextEditingController();
  String? _errorNama;

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  void _mulaiKuis() {
    final nama = _namaController.text.trim();

    if (nama.isEmpty) {
      setState(() => _errorNama = 'Isi namamu dulu ya');
      return;
    }

    setState(() => _errorNama = null);
    context.read<QuizProvider>().mulai(nama);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final u = context.unit;
    final w = context.warna;

    final branding = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(u * 0.06),
          child: Image.asset(
            'assets/images/logo.png',
            width: u * 0.3,
            height: u * 0.3,
          ),
        ),
        SizedBox(height: u * 0.04),
        Text(
          'Kuisin',
          style: TextStyle(
            fontSize: u * 0.12,
            fontWeight: FontWeight.w700,
            color: w.judul,
            height: 1.1,
          ),
        ),
        Text(
          'Seberapa jago kamu soal Flutter?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: u * 0.04, color: w.textMuted),
        ),
      ],
    );

    final formNama = Container(
      padding: EdgeInsets.all(u * 0.055),
      decoration: BoxDecoration(
        color: w.surface,
        borderRadius: BorderRadius.circular(u * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: u * 0.05,
            offset: Offset(0, u * 0.015),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Masukkan namamu',
            style: TextStyle(
              fontSize: u * 0.04,
              fontWeight: FontWeight.w500,
              color: w.textPrimary,
            ),
          ),
          SizedBox(height: u * 0.025),
          TextField(
            controller: _namaController,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            maxLength: 20,
            onSubmitted: (_) => _mulaiKuis(),
            style: TextStyle(fontSize: u * 0.042, color: w.textPrimary),
            decoration: InputDecoration(
              hintText: 'contoh: Budi',
              counterText: '',
              hintStyle: TextStyle(color: w.textMuted),
              errorText: _errorNama,
              prefixIcon: Icon(Icons.person_outline, color: w.textMuted),
              filled: true,
              fillColor: w.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(u * 0.03),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: u * 0.05),
          PrimaryButton(label: 'Mulai Kuis', onPressed: _mulaiKuis),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -u * 0.25,
            right: -u * 0.2,
            child: DecoCircle(ukuran: u * 0.6, warna: w.decoAtas),
          ),
          Positioned(
            bottom: -u * 0.3,
            left: -u * 0.25,
            child: DecoCircle(ukuran: u * 0.7, warna: w.decoBawah),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(u * 0.08, u * 0.15, u * 0.08, u * 0.08),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: context.lebarKonten),
                  child: context.isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: branding),
                            SizedBox(width: u * 0.08),
                            Expanded(child: formNama),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            branding,
                            SizedBox(height: u * 0.1),
                            formNama,
                          ],
                        ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: 'Skor tertinggi',
                    icon: Icon(Icons.leaderboard_outlined, color: w.judul),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RiwayatScreen()),
                    ),
                  ),
                  const ThemeToggleButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
