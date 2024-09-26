import 'package:flutter/material.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';
import 'package:spotify_bloc/core/constants/fonts_helper.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double fontSize;
  final Function onPressed;

  const PrimaryButton({
    required this.title,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          color: ColorHelper.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: ColorHelper.whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: FontsHelper.jostFamily,
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryDarkButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double fontSize;
  final Function onPressed;

  const PrimaryDarkButton({
    required this.title,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          color: ColorHelper.darkBgColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: ColorHelper.whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: FontsHelper.jostFamily,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onPressed});

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorHelper.textFeildFillColor,
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
