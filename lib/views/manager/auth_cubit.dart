import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      // Step 2: Save additional user data (e.g., National ID) in Firestore
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

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      // Log in the user
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? "Login failed"));
    } catch (e) {
      emit(AuthError("An unknown error occurred"));
    }
  }
}
