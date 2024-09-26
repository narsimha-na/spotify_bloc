import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/core/constants/assets_helper.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';
import 'package:spotify_bloc/core/routes/router_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushNamed(RoutesHelper.getStartedPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.darkBgColor,
      body: Center(
        child: SvgPicture.asset(
          alignment: Alignment.center,
          SvgHelper.logo,
          fit: BoxFit.fill,
          height: 60,
          width: 160,
        ),
      ),
    );
  }
}
