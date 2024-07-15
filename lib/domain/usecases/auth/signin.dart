import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/core/usecases/usecase.dart';
import 'package:spotify_bloc/data/models/auth/signin_user_req.dart';
import 'package:spotify_bloc/domain/repository/auth/auth_repository.dart';
import 'package:spotify_bloc/service_locator.dart';

class SignInUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
