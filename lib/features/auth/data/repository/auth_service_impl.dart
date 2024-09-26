import 'dart:developer';

import 'package:spotify_bloc/features/auth/domain/entities/auth_error.dart';
import 'package:spotify_bloc/features/auth/domain/entities/user_entity.dart';
import 'package:spotify_bloc/features/auth/domain/repository/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthServiceImpl extends AuthService {
  final auth.FirebaseAuth _firebaseAuth;

  AuthServiceImpl({
    required auth.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  UserEntitty _mapFirebaseUser(auth.User? user) {
    if (user == null) {
      return UserEntitty.empty();
    }

    var splittedName = ['Name ', 'Last Name'];
    if (user.displayName != null) {
      splittedName = user.displayName!.split(' ');
    }

    final map = <String, dynamic>{
      'id': user.uid,
      'firstName': splittedName.first,
      'lastName': splittedName.last,
      'email': user.email ?? '',
      'emailVerified': user.emailVerified,
      'imgUrl': user.photoURL ?? '',
      'isAnonymous': user.isAnonymous,
      'age': 0,
      'phoneNumber': '',
      'address': '',
    };
    return UserEntitty.fromJson(map);
  }

  @override
  Future<UserEntitty> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _mapFirebaseUser(userCredential.user);
    } on auth.FirebaseAuthException catch (e) {
      throw _determineError(e);
    }
  }

  @override
  Future<UserEntitty> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredtial = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log("EnteredImpl ${userCredtial.toString()}");
      return _mapFirebaseUser(userCredtial.user);
    } on auth.FirebaseAuthException catch (e) {
      throw _determineError(e);
    }
  }

  AuthError _determineError(auth.FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return AuthError.invalidEmail;
      case 'user-disabled':
        return AuthError.userDisabled;
      case 'user-not-found':
        return AuthError.userNotFound;
      case 'wrong-password':
        return AuthError.wrongPassword;
      case 'email-already-in-user':
      case 'account-exists-with-different-credential':
        return AuthError.emailAlreadyInUse;
      case 'invalid-credential':
        return AuthError.invalidCredential;
      case 'operation-not-allowed':
        return AuthError.operationNotAllowed;
      case 'weak-password':
        return AuthError.weakPassword;
      case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      default:
        return AuthError.error;
    }
  }
}
