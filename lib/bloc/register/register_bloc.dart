import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/validators.dart';
import '../../repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.empty()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submitted>(_onSubmitted);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.update(
        isPasswordValid: Validators.isValidPassword(event.password)));
  }

  Future<void> _onSubmitted(
      Submitted event, Emitter<RegisterState> emit) async {
    emit(RegisterState.loading());
    // here you write the codes to input the data into firestore

    try {
      dev.log('Signing up from repository', name: 'Register');
      await _authRepository.signUp(
          email: event.email, password: event.password);
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user?.uid)
          .set({
        "name": event.name,
        "email": event.email,
        "department": "",
        "enrollment": "",
        "uid": user?.uid.toString(),
        "avtar": user?.photoURL
      });

      emit(RegisterState.success());
    } catch (_) {
      emit(RegisterState.failure());
    }
  }
}
