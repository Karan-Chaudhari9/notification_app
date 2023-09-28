import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/config/validators.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/log_in/log_in_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailchangeController = TextEditingController();

  late LogInBloc _logInBloc;

  @override
  void initState() {
    dev.log("Login enter");
    _logInBloc = BlocProvider.of<LogInBloc>(context);
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogInBloc, LogInState>(
        bloc: BlocProvider.of<LogInBloc>(context),
        listener: (context, state) {
          Future<void> _showMyDialog({required String message}) async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error while login..'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[Text(message)],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Okay'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }

          if (state.isFailure) {
            print(state.message);
            _showMyDialog(message: state.message);
          } else if (state.isSubmitting) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logging in...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          } else if (state.isSuccess) {
            BlocProvider.of<AuthBloc>(context).add(LoggedIn());
            context.go('/home');
            // Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: BlocBuilder(
          bloc: _logInBloc,
          builder: (BuildContext context, LogInState state) {
            return Container(
              margin: const EdgeInsets.only(top: 50),
              color: Colors.grey.shade300,
              child: Stack(
                children: [
                  Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: ListView(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Image.asset('assets/images/Atmiya_Logo.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text(
                                'नमस्कारः',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 32),
                              ),
                              const Text(
                                'Sign in your account',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child: const Text('Forgot your Password?'),
                                  onPressed: () {
                                    pwdChange();
                                  },
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Container(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _onFormSubmitted,
                                  child: const Text(
                                    "Log in",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                context.go('/register');
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 29, 39, 157),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onEmailChanged() {
    _logInBloc.add(EmailChanged(email: emailController.text));
  }

  void _onPasswordChanged() {
    _logInBloc.add(PasswordChanged(password: passwordController.text));
  }

  void _onFormSubmitted() {
    if (!Validators.isValidEmail(emailController.text)) {
      showSeekError("Enter valid email");
    } else if (emailController.text.isEmpty &&
        passwordController.text.isEmpty) {
      showSeekError("Password can't be emplat");
    } else if (passwordController.text.length < 6) {
      showSeekError("password lenth miminus 6 character");
    } else {
      _logInBloc.add(LogInWithCredentialsPressed(
          email: emailController.text, password: passwordController.text));
    }
  }

  void showSeekError(String error) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(error),
            ],
          ),
        ),
      );
  }

  void _onGooglePressed() {
    _logInBloc.add(LogInWithGooglePressed());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> pwdChange() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your emaill address'),
          content: TextFormField(
            controller: emailchangeController,
            decoration: const InputDecoration(
                label: Text("email"), border: OutlineInputBorder()),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                try {
                  FirebaseAuth.instance.sendPasswordResetEmail(
                      email: emailchangeController.text);
                } catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                }
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
