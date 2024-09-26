import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';

class TextFeildsHelper {
  static Widget authFormFields({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
    required Function(String value) onChanged,
  }) =>
      TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: ColorHelper.whiteColor,
          fontSize: 16,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorHelper.textFeildFillColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          hintText: labelText,
          hintStyle: const TextStyle(color: ColorHelper.whiteColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorHelper.textFeildFillColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          focusColor: ColorHelper.textFeildFillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorHelper.textFeildFillColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorHelper.textFeildFillColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          ),
        ),
      );
}
