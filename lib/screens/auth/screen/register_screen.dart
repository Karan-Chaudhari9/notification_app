import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/config/validators.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/register/register_bloc.dart';
import '../../../repository/auth_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegisterScreen(),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  late RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = RegisterBloc(authRepository: AuthRepository());
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
    confirmPasswordController.addListener(_onConfirmPasswordChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<RegisterBloc, RegisterState>(
          bloc: _registerBloc,
          listener: (context, state) {
            if (state.isFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Register failure'),
                        Icon(Icons.error),
                      ],
                    ),
                  ),
                );
            } else if (state.isSubmitting) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Registering...'),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
            } else if (state.isSuccess) {
              BlocProvider.of<AuthBloc>(context).add(LoggedIn());
              context.go("/home");
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: _registerBloc,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 150,
                      child: Image.asset('assets/images/Atmiya_Logo.png'),
                    ),
                    const Text(
                      'नमस्कारः',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
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
                      cursorColor: Colors.black,
                      controller: nameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Full name',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: emailController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                      obscureText: true,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder()),
                      obscureText: true,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _onFormSubmitted,
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(password: passwordController.text));
  }

  void _onConfirmPasswordChanged() {}

  void _onFormSubmitted() {
    try {
      if (nameController.text.isEmpty) {
        showSeekError("Enter your name");
      } else if (!Validators.isValidEmail(emailController.text)) {
        showSeekError("Enter valid email");
      } else if (passwordController.text.isEmpty) {
        showSeekError("Enter password");
      } else if (passwordController.text != confirmPasswordController.text) {
        showSeekError("Both password must be same");
      } else if (passwordController.text == confirmPasswordController.text) {
        _registerBloc.add(Submitted(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text));
      }
    } catch (e) {
      showSeekError(e.toString());
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
