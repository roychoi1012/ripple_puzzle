import 'package:flutter/material.dart';
import 'package:ripple_puzzle/core/style/app_color.dart';
import 'package:ripple_puzzle/core/style/app_font.dart';

class LargeButton extends StatelessWidget {
  final Color backGroundColor;
  final IconData icon;
  final String text;
  const LargeButton({
    super.key,
    required this.icon,
    required this.text,
    required this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.white),
          const SizedBox(width: 8),
          Text(text, style: AppFonts.largeTextBold.copyWith(color: AppColor.white))
        ],
      ),
    );
  }
}
