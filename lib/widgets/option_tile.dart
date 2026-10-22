import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';


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
    final u = context.unit;
    final w = context.warna;

    return Padding(
      padding: EdgeInsets.only(bottom: u * 0.03),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(u * 0.035),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(u * 0.035),
          decoration: BoxDecoration(
            color: selected ? w.primary : w.surface,
            borderRadius: BorderRadius.circular(u * 0.035),
            border: Border.all(
              color: selected ? w.primary : w.outline,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: u * 0.04,
                backgroundColor: selected ? w.accent : w.background,
                child: Text(
                  huruf,
                  style: TextStyle(
                    fontSize: u * 0.035,
                    fontWeight: FontWeight.w700,
                    color: selected ? w.onAccent : w.textPrimary,
                  ),
                ),
              ),
              SizedBox(width: u * 0.035),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: u * 0.038,
                    color: selected ? w.onPrimary : w.textPrimary,
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
