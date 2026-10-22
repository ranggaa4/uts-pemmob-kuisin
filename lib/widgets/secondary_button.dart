import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const SecondaryButton({
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: w.judul,
          side: BorderSide(color: w.judul.withValues(alpha: 0.5), width: 1.5),
          padding: EdgeInsets.symmetric(vertical: u * 0.038),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(u * 0.035),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: u * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
