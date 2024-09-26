import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_bloc/core/constants/assets_helper.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                margin: const EdgeInsets.only(right: 24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5B5B5B),
                      Color(0xFF252525),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      32,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Or',
              style: TextStyle(
                color: ColorHelper.whiteColor,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                margin: const EdgeInsets.only(left: 24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5B5B5B),
                      Color(0xFF252525),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      32,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgHelper.googleIcon,
              height: 36,
              width: 36,
            ),
            const SizedBox(
              width: 76,
            ),
            SvgPicture.asset(
              SvgHelper.appleIcon,
              height: 40,
              width: 40,
            ),
          ],
        )
      ],
    );
  }
}
