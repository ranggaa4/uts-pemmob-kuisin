import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/quiz_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const KuisinApp(),
    ),
  );
}

class KuisinApp extends StatelessWidget {
  const KuisinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuisin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.indigo,
          primary: AppColors.indigo,
          secondary: AppColors.amber,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
