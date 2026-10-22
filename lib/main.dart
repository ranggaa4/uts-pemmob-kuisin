import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/dummy_questions.dart';
import 'providers/quiz_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'services/score_storage.dart';
import 'theme/app_theme.dart';

void main() {
  final storage = ScoreStorage();

  runApp(
    MultiProvider(
      providers: [
        Provider<ScoreStorage>.value(value: storage),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => QuizProvider(
            bankSoal: dummyQuestions,
            storage: storage,
          ),
        ),
      ],
      child: const KuisinApp(),
    ),
  );
}

class KuisinApp extends StatelessWidget {
  const KuisinApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Kuisin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: tema.mode,
      home: const HomeScreen(),
    );
  }
}
