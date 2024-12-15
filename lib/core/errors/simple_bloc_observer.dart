import 'package:bloc/bloc.dart';
import 'package:jo_univ_flutter/core/utils/logger.dart';

/// Simple implementation of BlocObserver for debugging and logging purposes.
/// Provides default implementations for all observer methods, printing information to the console.
/// Can be extended or customized for specific logging or error handling requirements.
class SimpleBLocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    Logger.logToConsole('Change = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    Logger.logToConsole('closed = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    Logger.logToConsole('created = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger.logToConsole('bloc = $bloc' ' transition= $transition');
  }
}
