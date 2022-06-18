import 'package:clean_api/clean_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Source;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_bag/domain/app/source.dart';
import 'package:money_bag/domain/app/user-profile.dart';

import 'package:money_bag/domain/auth/i_auth_repo.dart';
import 'package:money_bag/domain/auth/signup_body.dart';
import 'package:money_bag/domain/auth/login_body.dart';

class FirebaseAuthRepo extends IAuthRepo {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  @override
  TaskEither<CleanFailure, UserProfile> login(LoginBody body) =>
      TaskEither.tryCatch(() async {
        final loginResponce = await auth.signInWithEmailAndPassword(
            email: body.email, password: body.password);
        if (loginResponce.user != null) {
          final data = await db
              .collection('User')
              .doc(loginResponce.user!.uid)
              .get()
              .then((value) => value.data());
          if (data != null) {
            final profile = UserProfile.fromMap(data);
            return profile;
          } else {
            throw "Profile Data Not Found";
          }
        } else {
          throw "Log in was unsuccessfull, somthing was wrong";
        }
      }, (error, _) => CleanFailure(tag: "Login", error: error.toString()));

  @override
  TaskEither<CleanFailure, UserProfile> registration(RegistrationBody body) =>
      TaskEither.tryCatch(() async {
        final loginResponce = await auth.createUserWithEmailAndPassword(
            email: body.email, password: body.password);

        if (loginResponce.user != null) {
          final profile = UserProfile(
              name: body.name,
              id: loginResponce.user!.uid,
              email: body.email,
              source: [Source(name: "Cash", createAt: DateTime.now())]);
          await db
              .collection('User')
              .doc(loginResponce.user!.uid)
              .set(profile.toMap());

          return profile;
        } else {
          throw "Sign Up in was unsuccessfull, somthing was wrong";
        }
      },
          (error, _) =>
              CleanFailure(tag: "Registration", error: error.toString()));

  @override
  TaskEither<CleanFailure, UserProfile> checkAuth() =>
      TaskEither.tryCatch(() async {
        final user = auth.currentUser;
        if (user != null) {
          final data = await db
              .collection('User')
              .doc(user.uid)
              .get()
              .then((value) => value.data());
          if (data != null) {
            final profile = UserProfile.fromMap(data);
            return profile;
          } else {
            throw "Profile Data Not Found";
          }
        } else {
          throw "You are not logged in, ";
        }
      },
          (error, _) =>
              CleanFailure(tag: "Check Auth", error: error.toString()));
}
