import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maydon_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:maydon_app/pages/get_started_page.dart';
import 'package:maydon_app/pages/home_page.dart';
import 'package:maydon_app/services/auth_services.dart';

class MaydonApp extends StatelessWidget {
  const MaydonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
        home: StreamBuilder<User?>(
          initialData: null,
          stream: AuthService.auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              debugPrint("Data :: ${snapshot.data}");
              return const HomePage();
            } else {
              return const GetStartedPage();
            }
          },
        ),
      ),
    );
  }
}
