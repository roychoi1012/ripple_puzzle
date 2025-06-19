import 'package:flutter/material.dart';
import 'package:ripple_puzzle/core/style/app_color.dart';
import 'package:ripple_puzzle/core/style/app_font.dart';

class LargeButton extends StatelessWidget {
  final Color backGroundColor;
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  
  const LargeButton({
    super.key,
    required this.icon,
    required this.text,
    required this.backGroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: onPressed != null ? backGroundColor : backGroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: onPressed != null ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, 
              color: onPressed != null ? AppColor.white : AppColor.white.withOpacity(0.6),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppFonts.largeTextBold.copyWith(
                color: onPressed != null ? AppColor.white : AppColor.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}