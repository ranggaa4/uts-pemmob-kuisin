import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';


class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final gelap = brightness == Brightness.dark;

    return IconButton(
      tooltip: gelap ? 'Mode terang' : 'Mode gelap',
      icon: Icon(
        gelap ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        color: context.warna.judul,
      ),
      onPressed: () => context.read<ThemeProvider>().toggle(brightness),
    );
  }
}
