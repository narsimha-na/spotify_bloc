import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/data/models/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> singUp(CreateUserReq createUserReq);
  Future<void> signIn();
}
