import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/core/routes/router_helper.dart';
import 'package:spotify_bloc/features/auth/presentation/auth_page.dart';
import 'package:spotify_bloc/features/auth/presentation/login_page.dart';
import 'package:spotify_bloc/features/auth/presentation/singup_page.dart';
import 'package:spotify_bloc/features/auth/presentation/welcome/choose_mode_page.dart';
import 'package:spotify_bloc/features/auth/presentation/welcome/error_page.dart';
import 'package:spotify_bloc/features/auth/presentation/welcome/get_started_page.dart';
import 'package:spotify_bloc/features/auth/presentation/welcome/splash.dart';
import 'package:spotify_bloc/features/home/presentation/home_page.dart';

class Routes {
  static GoRouter returnRouter(
    bool isAuth,
  ) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: RoutesHelper.splashPage,
          path: "/${RoutesHelper.mainRoute}",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(
              child: SplashPage(),
            );
          },
        ),
        // GoRoute(
        //   name: RoutesHelper.splashPage,
        //   path: "/${RoutesHelper.splashPage}",
        //   pageBuilder: (BuildContext context, GoRouterState state) {
        //     return const MaterialPage(
        //       child: SplashPage(),
        //     );
        //   },
        // ),
        GoRoute(
          name: RoutesHelper.getStartedPage,
          path: "/${RoutesHelper.getStartedPage}",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: GetStartedPage(),
            );
          },
        ),
        GoRoute(
            name: RoutesHelper.selectModePage,
            path: "/${RoutesHelper.selectModePage}",
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ChooseModePage(),
              );
            }),
        GoRoute(
            name: RoutesHelper.authPage,
            path: '/${RoutesHelper.authPage}',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: AuthPage(),
              );
            }),
        GoRoute(
            name: RoutesHelper.singUpPage,
            path: '/${RoutesHelper.singUpPage}',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: SingUpPage(),
              );
            }),
        GoRoute(
            name: RoutesHelper.loginPage,
            path: '/${RoutesHelper.loginPage}',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: LoginPage(),
              );
            }),
        GoRoute(
          name: RoutesHelper.homePage,
          path: "/${RoutesHelper.homePage}",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: HomePage(),
            );
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          child: ErrorPage(),
        );
      },
      // redirect: (context, state) {
      //   if (!isAuth) {
      //     return (RoutesHelper.getStartedPage);
      //   } else {
      //     return RoutesHelper.homePage;
      //   }
      // },
    );
    return router;
  }
}
