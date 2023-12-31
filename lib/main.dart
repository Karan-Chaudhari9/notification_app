import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/bloc/register/register_bloc.dart';
import 'package:notification_app/config/route.dart';
import 'package:notification_app/firebase_options.dart';
import 'package:notification_app/repository/auth_repository.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/log_in/log_in_bloc.dart';
import 'manager/create_event_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(builder:(context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EventBloc eventBloc = EventBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository())..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => LogInBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authRepository: AuthRepository()),
        ),
        BlocProvider<EventBloc>(
          create: (context) =>
              EventBloc(), // You should replace EventBloc with your actual BLoC class
        )
      ],
      child: MaterialApp.router(
        showSemanticsDebugger: false,
        title: 'Event Management App',
        theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
