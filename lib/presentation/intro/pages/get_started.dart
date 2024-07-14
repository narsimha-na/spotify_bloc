import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_bloc/common/widgets/buttons.dart';
import 'package:spotify_bloc/core/configs/assets/app_images.dart';
import 'package:spotify_bloc/core/configs/assets/app_vectors.dart';
import 'package:spotify_bloc/core/configs/themes/app_colors.dart';
import 'package:spotify_bloc/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.bgGetStarted,
                ),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Enjoy Listening To MusicEnjoy Listening To Music Enjoy Listening To MusicEnjoy Listening To Music, Enjoy Listening To MusicEnjoy Listening To Music Enjoy Listening To MusicEnjoy Listening To Music',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  onPressed: () {
                    log("button cliked");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseMode()));
                  },
                  title: 'Getd Started',
                ),
              ],
            ),
          ),
          // Container(
          //           color: Colors.black.withOpacity(0.15),
          //         ),
        ],
      ),
    );
  }
}
