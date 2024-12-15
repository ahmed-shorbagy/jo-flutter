import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register(String nationalId, String email, String password) async {
    emit(AuthLoading());
    try {
      // Add logic to register user with National ID
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError("Registration failed"));
    }
  }
}
