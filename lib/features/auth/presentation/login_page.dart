// ignore_for_file: unnecessary_const

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/core/constants/assets_helper.dart';
import 'package:spotify_bloc/core/constants/color_helper.dart';
import 'package:spotify_bloc/core/constants/fonts_helper.dart';
import 'package:spotify_bloc/core/routes/router_helper.dart';
import 'package:spotify_bloc/core/widgets/buttons.dart';
import 'package:spotify_bloc/core/widgets/text_fields.dart';
import 'package:spotify_bloc/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:spotify_bloc/features/auth/presentation/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        log("state : ${state.status.toString()}");
        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Sucessfull failure',
            ),
            duration: Duration(milliseconds: 500),
          ));
        }
        if (state.status == AuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Sucessfull Login'),
            duration: Duration(milliseconds: 500),
          ));
          GoRouter.of(context).pushNamed(RoutesHelper.homePage);
        }
      },
      child: Scaffold(
        backgroundColor: ColorHelper.darkBgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 72,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  SvgPicture.asset(
                    SvgHelper.logo,
                    height: 32,
                    width: 108,
                  ),
                  const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 46,
              ),
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontsHelper.jostFamily,
                  fontWeight: FontWeight.w800,
                  color: ColorHelper.whiteColor,
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'If You Need Any Support',
                      style: TextStyle(
                        color: ColorHelper.whiteColor,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '\tClick Here',
                      style: TextStyle(
                        color: ColorHelper.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              TextFeildsHelper.authFormFields(
                  controller: emailController,
                  labelText: 'Email Id',
                  onChanged: (val) {
                    context
                        .read<AuthBloc>()
                        .add(SignUpEmailChangedEvent(email: val));
                  }),
              const SizedBox(
                height: 24,
              ),
              TextFeildsHelper.authFormFields(
                  controller: passwordController,
                  labelText: 'Password',
                  isPassword: true,
                  onChanged: (val) {
                    context
                        .read<AuthBloc>()
                        .add(SignUpPasswordChangedEvent(password: val));
                  }),
              const SizedBox(
                height: 42,
              ),
              PrimaryButton(
                title: 'Loginddd'.toUpperCase(),
                height: 72,
                width: double.infinity,
                fontSize: 18,
                onPressed: () {
                  log("button cliec");
                  context.read<AuthBloc>().add(const LoginButtonPressedEvent());
                },
              ),
              const SizedBox(
                height: 34,
              ),
              const SocialWidget(),
              const SizedBox(
                height: 34,
              ),
              GestureDetector(
                onTap: () {
                  context.go(RoutesHelper.loginPage);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already a registered !',
                        style: TextStyle(
                          color: ColorHelper.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: '\tClick Here',
                        style: TextStyle(
                          color: ColorHelper.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
