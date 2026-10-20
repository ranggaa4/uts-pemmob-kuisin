import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.sizeOf(context).width;
    final base = lebar > 600 ? 600.0 : lebar;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.amber,
          foregroundColor: AppColors.ink,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: base * 0.038),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(base * 0.035),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: base * 0.042,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
