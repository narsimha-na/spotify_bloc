import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_bloc/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> singIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return const Right('SingUp was Successfull');
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = 'Password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'Account already exists with that email';
      }

      return Left(message);
    }
  }

  @override
  Future<void> singIn() {
    throw UnimplementedError();
  }
}
