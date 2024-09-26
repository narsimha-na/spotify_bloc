import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/core/constants/assets_helper.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';
import 'package:spotify_bloc/core/constants/fonts_helper.dart';
import 'package:spotify_bloc/core/routes/router_helper.dart';
import 'package:spotify_bloc/core/widgets/buttons.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.darkBgColor,
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: FontsHelper.jostFamily,
                          fontWeight: FontWeight.w600,
                          color: ColorHelper.greyColor),
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
                        GoRouter.of(context).pushNamed(RoutesHelper.authPage);
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
