import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/core/constants/assets_helper.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';
import 'package:spotify_bloc/core/constants/fonts_helper.dart';
import 'package:spotify_bloc/core/routes/router_helper.dart';
import 'package:spotify_bloc/core/widgets/buttons.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AssetsHelper.bgGetStartedPage),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(SvgHelper.logo),
                Column(
                  children: [
                    const Text(
                      'Choose Mode',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: FontsHelper.jostFamily,
                        fontWeight: FontWeight.w600,
                        color: ColorHelper.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color(0xFFFFFFFF).withOpacity(0.08),
                          radius: 36,
                          child: SvgPicture.asset(
                            SvgHelper.lightMode,
                          ),
                        ),
                        CircleAvatar(
                            backgroundColor: true
                                ? ColorHelper.whiteColor
                                : const Color(0xFFFFFFFF).withOpacity(0.1),
                            radius: 36,
                            child: SvgPicture.asset(
                              SvgHelper.darkMode,
                              colorFilter: const ColorFilter.mode(
                                false
                                    ? ColorHelper.whiteColor
                                    : ColorHelper.darkBgColor,
                                BlendMode.srcIn,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryButton(
                      title: 'Get Started',
                      height: 90,
                      width: double.infinity,
                      fontSize: 24,
                      onPressed: () {
                        context.go(RoutesHelper.authPage);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
