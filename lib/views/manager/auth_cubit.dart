import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jo_univ_flutter/core/utils/logger.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthCubit() : super(AuthInitial());

  void register(String nationalId, String email, String password) async {
    emit(AuthLoading());
    try {
      // Step 1: Create user with Firebase Authentication
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Step 2: Save user data in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': email,
        'nationalId': nationalId,
        'createdAt': DateTime.now(),
      });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? "Registration failed"));
    } catch (e) {
      emit(AuthError("An unknown error occurred"));
    }
  }

  void signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      // Step 1: Sign in user with Firebase Authentication
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Step 2: Fetch user data from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (userDoc.exists) {
        // Optional: Retrieve and log user data
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        print('User data: $userData');
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user data found in Firestore.',
        );
      }

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? "Login failed"));
    } catch (e) {
      Logger.error(e.toString());
      emit(AuthError("An unknown error occurred"));
    }
  }
}
