import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elisoft/cubit/article_fetch_cubit.dart';
import 'package:flutter_elisoft/cubit/auth_cubit.dart';
import 'package:flutter_elisoft/ui/screens/home_screen.dart';
import 'package:flutter_elisoft/ui/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ArticleFetchCubit(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Flutter Elisoft',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffffffff),
            primarySwatch: Colors.blue,
          ),
          initialRoute: LoginScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
          },
        ),
      ),
    );
  }
}
