import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const KuisinApp());
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
