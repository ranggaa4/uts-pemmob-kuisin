import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

// satu pilihan jawaban (A/B/C/D)
class OptionTile extends StatelessWidget {
  final String huruf;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.huruf,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.sizeOf(context).width;
    final base = lebar > 600 ? 600.0 : lebar;

    return Padding(
      padding: EdgeInsets.only(bottom: base * 0.03),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(base * 0.035),
        child: Container(
          padding: EdgeInsets.all(base * 0.035),
          decoration: BoxDecoration(
            color: selected ? AppColors.indigo : Colors.white,
            borderRadius: BorderRadius.circular(base * 0.035),
            border: Border.all(
              color: selected ? AppColors.indigo : AppColors.indigo.withValues(alpha: 0.15),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: base * 0.04,
                backgroundColor: selected ? AppColors.amber : AppColors.cream,
                child: Text(
                  huruf,
                  style: TextStyle(
                    fontSize: base * 0.035,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ),
              SizedBox(width: base * 0.035),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: base * 0.038,
                    color: selected ? Colors.white : AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
