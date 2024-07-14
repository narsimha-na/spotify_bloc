import 'package:get_it/get_it.dart';
import 'package:spotify_bloc/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_bloc/data/sources/auth/auth_firebase_serivce.dart';
import 'package:spotify_bloc/domain/repository/auth/auth_repository.dart';
import 'package:spotify_bloc/domain/usecases/auth/singup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
}
