import 'package:spotify_bloc/features/auth/domain/entities/user_entity.dart';

abstract class AuthService {
  Future<UserEntitty> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntitty> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
