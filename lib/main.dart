import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_bloc/core/routes/routes.dart';
import 'package:spotify_bloc/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:spotify_bloc/features/auth/data/repository/auth_service_impl.dart';
import 'package:spotify_bloc/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthServiceImpl(
        firebaseAuth: FirebaseAuth.instance,
      ),
      child: BlocProvider( 
        create: (context) => AuthBloc(
          authService: context.read<AuthServiceImpl>(),
        ),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: (context, router) {
            return Theme(
              data: ThemeData.light(),
              child: router!,
            );
          },
          routeInformationParser:
              Routes.returnRouter(false).routeInformationParser,
          routerDelegate: Routes.returnRouter(false).routerDelegate,
          // routerConfig: Routes.returnRouter(false),
        ),
      ),
    );
  }
}
