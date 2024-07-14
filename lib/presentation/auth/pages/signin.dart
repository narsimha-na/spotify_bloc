import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_bloc/common/widgets/appbars/basic_appbar.dart';
import 'package:spotify_bloc/common/widgets/buttons.dart';
import 'package:spotify_bloc/core/configs/assets/app_vectors.dart';
import 'package:spotify_bloc/presentation/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _siginText(context),
        appBar: BasicAppBar(
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 20,
            width: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              _signInText(),
              const SizedBox(height: 30),
              _emailField(context),
              const SizedBox(height: 30),
              _passwordField(context),
              const SizedBox(height: 30),
              PrimaryButton(onPressed: () {}, title: 'Sign In'),
            ],
          ),
        ));
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Enter password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 42.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SingUpPage()),
              );
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
