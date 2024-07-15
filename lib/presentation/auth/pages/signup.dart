import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_bloc/common/widgets/appbars/basic_appbar.dart';
import 'package:spotify_bloc/common/widgets/buttons.dart';
import 'package:spotify_bloc/core/configs/assets/app_vectors.dart';
import 'package:spotify_bloc/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/domain/usecases/auth/singup.dart';
import 'package:spotify_bloc/presentation/auth/pages/signin.dart';
import 'package:spotify_bloc/presentation/home/pages/home.dart';
import 'package:spotify_bloc/service_locator.dart';

class SingUpPage extends StatelessWidget {
  SingUpPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              _registerText(),
              const SizedBox(height: 30),
              _registerFullName(context),
              const SizedBox(height: 30),
              _emailField(context),
              const SizedBox(height: 30),
              _passwordField(context),
              const SizedBox(height: 30),
              PrimaryButton(
                  onPressed: () async {
                    var result = await sl<SignUpUseCase>().call(
                        params: CreateUserReq(
                      fullName: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ));
                    result.fold((l) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        l,
                        style: const TextStyle(color: Colors.white),
                      )));
                    }, (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomePage()),
                          (route) => false);
                    });
                  },
                  title: 'Create Account'),
            ],
          ),
        ));
  }

  Widget _registerText() {
    return const Text(
      'Register',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _registerFullName(BuildContext context) {
    return TextField(
      controller: _nameController,
      decoration: const InputDecoration(hintText: 'Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
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
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
            child: const Text(
              'Sign In',
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
