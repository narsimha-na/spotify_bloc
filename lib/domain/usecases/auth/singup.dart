import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/core/usecases/usecase.dart';
import 'package:spotify_bloc/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/domain/repository/auth/auth_repository.dart';
import 'package:spotify_bloc/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().singUp(params!);
  }
}
