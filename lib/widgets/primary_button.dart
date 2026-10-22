import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final u = context.unit;
    final w = context.warna;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: w.accent,
          foregroundColor: w.onAccent,
          disabledBackgroundColor: w.accent.withValues(alpha: 0.4),
          disabledForegroundColor: w.onAccent.withValues(alpha: 0.4),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: u * 0.038),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(u * 0.035),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: u * 0.042,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
