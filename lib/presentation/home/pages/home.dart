import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_bloc/common/widgets/appbars/basic_appbar.dart';
import 'package:spotify_bloc/core/configs/assets/app_vectors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Container(
      height: 180,
      child: SvgPicture.asset(AppVectors.bgAuthTopLayer),
    );
  }
}
