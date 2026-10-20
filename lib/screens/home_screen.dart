import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'quiz_screen.dart';

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
      setState(() => _errorNama = 'Isi namamu dulu ya!');
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
    final size = MediaQuery.sizeOf(context);
    // di tablet / web lebar dibatasi supaya tidak melebar
    final base = size.width > 600 ? 600.0 : size.width;

    return Scaffold(
      body: Stack(
        children: [
          // lingkaran dekorasi di background
          Positioned(
            top: -size.width * 0.25,
            right: -size.width * 0.2,
            child: Container(
              width: size.width * 0.6,
              height: size.width * 0.6,
              decoration: const BoxDecoration(
                color: AppColors.amber,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -size.width * 0.3,
            left: -size.width * 0.25,
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              decoration: BoxDecoration(
                color: AppColors.indigo.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: base * 0.08),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(base * 0.06),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: base * 0.3,
                          height: base * 0.3,
                        ),
                      ),
                      SizedBox(height: base * 0.04),
                      Text(
                        'Kuisin',
                        style: TextStyle(
                          fontSize: base * 0.12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.indigo,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        'Seberapa jago kamu soal Flutter?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: base * 0.04,
                          color: AppColors.ink.withValues(alpha: 0.7),
                        ),
                      ),
                      SizedBox(height: base * 0.1),
                      Container(
                        padding: EdgeInsets.all(base * 0.055),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(base * 0.05),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.indigo.withValues(alpha: 0.1),
                              blurRadius: base * 0.05,
                              offset: Offset(0, base * 0.015),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Masukkan namamu',
                              style: TextStyle(
                                fontSize: base * 0.04,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ink,
                              ),
                            ),
                            SizedBox(height: base * 0.025),
                            TextField(
                              controller: _namaController,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (_) => _mulaiKuis(),
                              style: TextStyle(fontSize: base * 0.042),
                              decoration: InputDecoration(
                                errorText: _errorNama,
                                prefixIcon: const Icon(Icons.person_outline),
                                filled: true,
                                fillColor: AppColors.cream,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(base * 0.03),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: base * 0.05),
                            PrimaryButton(
                              label: 'Mulai Kuis',
                              onPressed: _mulaiKuis,
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
        ],
      ),
    );
  }
}
