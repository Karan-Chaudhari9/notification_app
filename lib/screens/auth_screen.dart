import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/screens/login_screen.dart';

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
          context.go("/login");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogInScreen()),
          );
          dev.log('Uninitialized State', name: 'AuthState');
        } else if (state is UnAuthenticated) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogInScreen()),
          );
          dev.log('UnAuthenticated State', name: 'AuthState');
          context.go('/login');
        } else if (state is Authenticated) {
          dev.log('Authenticated state in AuthScreen, Going home screen');
          context.go("/home");
        } else {
          dev.log('Unknown state', name: 'AuthState');
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text("Something went wrong restart your app"),
        ),
      ),
    );
  }
}