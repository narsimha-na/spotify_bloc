import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/data/models/auth/signin_user_req.dart';
import 'package:spotify_bloc/data/sources/auth/auth_firebase_serivce.dart';
import 'package:spotify_bloc/domain/repository/auth/auth_repository.dart';
import 'package:spotify_bloc/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq userReq) async {
    return await sl<AuthFirebaseService>().singIn(userReq);
  }

  @override
  Future<Either> singUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
