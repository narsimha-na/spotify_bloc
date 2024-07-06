import 'package:flutter/material.dart';
import 'package:spotify_bloc/core/configs/themes/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const PrimaryButton(
      {required this.onPressed, required this.title, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? (80.0)),
      ),
      child: Text(
        title,
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
