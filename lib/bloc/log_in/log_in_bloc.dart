import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/validators.dart';
import '../../repository/auth_repository.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LogInState.empty()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LogInWithGooglePressed>(_onLogInWithGooglePressed);
    on<LogInWithCredentialsPressed>(_onLogInWithCredentialPressed);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(EmailChanged event, Emitter<LogInState> emit) {
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LogInState> emit) {
    emit(state.update(
        isPasswordValid: Validators.isValidPassword(event.password)));
  }

  Future<void> _onLogInWithGooglePressed(
      LogInWithGooglePressed event, Emitter<LogInState> emit) async {
    try {
      await _authRepository.signInWithGoogle();
      emit(LogInState.success());
    } on FirebaseAuthException catch (e) {
      emit(LogInState.failure(error: "error"));
      dev.log(e.message.toString(), name: "FirebaseAuthException");
    } catch (e) {
      dev.log(e.toString(), name: "Firebase Catch");
    }
  }

  Future<void> _onLogInWithCredentialPressed(
      LogInWithCredentialsPressed event, Emitter<LogInState> emit) async {
    try {
      await _authRepository.signInWithCredentials(event.email, event.password);
      emit(LogInState.success());
    } on FirebaseAuthException catch (e) {
      emit(LogInState.failure(error: e.message.toString()));
    } catch (e) {
      emit(LogInState.failure(error: e.toString()));
    }
  }
}
