import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_bloc/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> singIn(SigninUserReq userReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      FirebaseFirestore.instance.collection('Users').add({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });
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
  Future<Either> singIn(SigninUserReq userReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userReq.email,
        password: userReq.password,
      );
      return const Right('SignIn was Successfull');
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'invalid-email') {
        message = 'user not found for this email id';
      } else if (e.code == 'invalid-credential') {
        message = 'password is incorrect';
      }

      return Left(message);
    }
  }
}
