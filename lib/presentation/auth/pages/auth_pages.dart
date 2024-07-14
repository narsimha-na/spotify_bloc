import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_bloc/common/widgets/buttons.dart';
import 'package:spotify_bloc/core/configs/assets/app_images.dart';
import 'package:spotify_bloc/core/configs/assets/app_vectors.dart';
import 'package:spotify_bloc/core/configs/themes/app_colors.dart';
import 'package:spotify_bloc/presentation/auth/pages/signup.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.bgAuthTopLayer),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bgAuthBottomLayer),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(AppImages.bgAuthPerson),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Enjoying Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Enjoying Listening To Music, Enjoying Listening To Music Enjoying Listening To Music,Enjoying Listening To Music',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.darkGrey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            log("button cliked");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingUpPage()),
                            );
                          },
                          title: 'Register',
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
