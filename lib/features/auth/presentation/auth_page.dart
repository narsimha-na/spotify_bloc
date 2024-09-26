import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/core/constants/assets_helper.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';
import 'package:spotify_bloc/core/constants/fonts_helper.dart';
import 'package:spotify_bloc/core/routes/router_helper.dart';
import 'package:spotify_bloc/core/widgets/buttons.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.darkBgColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 64,
              left: 16,
            ),
            child: CustomBackButton(
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              SvgHelper.bgAuthBottomLayer,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              SvgHelper.bgAuthTopLayer,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AssetsHelper.bgAuthStartedPage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 78,
                    width: 236,
                    child: SvgPicture.asset(
                      SvgHelper.logo,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                const Text(
                  'Enjoy listening to music ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: FontsHelper.jostFamily,
                    fontWeight: FontWeight.w700,
                    color: ColorHelper.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontsHelper.jostFamily,
                      fontWeight: FontWeight.w400,
                      color: ColorHelper.greyColor),
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrimaryButton(
                      title: 'Register',
                      height: 72,
                      width: 124,
                      fontSize: 16,
                      onPressed: () {
                        GoRouter.of(context).pushNamed(RoutesHelper.singUpPage);
                      },
                    ),
                    PrimaryDarkButton(
                      title: 'Login',
                      height: 72,
                      width: 124,
                      fontSize: 16,
                      onPressed: () {
                        GoRouter.of(context).pushNamed(RoutesHelper.loginPage);
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
