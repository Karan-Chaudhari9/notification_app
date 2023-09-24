import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/screens/signup_screen.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/log_in/log_in_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static const routeName = 'login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LogInScreen(),
    );
  }

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late LogInBloc _logInBloc;

  @override
  void initState() {
    _logInBloc = BlocProvider.of<LogInBloc>(context);
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: Text(
              'Log In',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      body: BlocListener<LogInBloc, LogInState>(
        bloc: BlocProvider.of<LogInBloc>(context),
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
                      Text('Log In failure'),
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
                      Text('Logging in...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          } else if (state.isSuccess) {
            BlocProvider.of<AuthBloc>(context).add(LoggedIn());
            Navigator.pushReplacementNamed(context, '/home');
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
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28,
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot your Password?',
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                height: 53,
                                width: 120,
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  onPressed: () {},
                                  color: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            const SizedBox(
                              width: 10.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const SignupPage()));
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
    _logInBloc.add(LogInWithCredentialsPressed(
        email: emailController.text, password: passwordController.text));
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
}