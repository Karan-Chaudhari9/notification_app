import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth/auth_bloc.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Uninitialized) {
          context.go("/home");
          dev.log('Uninitialized State', name: 'AuthState');
        } else if (state is UnAuthenticated) {
          Navigator.pushReplacementNamed(context, '/login');
          print("Demo");
        } else if (state is Authenticated) {
          dev.log('Authenticated state in AuthScreen, Going home screen');
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          dev.log('Unknown state', name: 'AuthState');
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}