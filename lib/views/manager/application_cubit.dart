import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ApplicationState {}

class ApplicationInitial extends ApplicationState {}

class ApplicationLoading extends ApplicationState {}

class ApplicationSuccess extends ApplicationState {}

class ApplicationError extends ApplicationState {
  final String message;

  ApplicationError(this.message);
}

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial());

  void submitApplication(Map<String, dynamic> applicationData) async {
    emit(ApplicationLoading());
    try {
      // Save application data to Firestore
      await Future.delayed(Duration(seconds: 2));
      emit(ApplicationSuccess());
    } catch (e) {
      emit(ApplicationError("Submission failed"));
    }
  }
}
