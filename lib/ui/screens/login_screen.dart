import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elisoft/cubit/article_fetch_cubit.dart';
import 'package:flutter_elisoft/cubit/auth_cubit.dart';
import 'package:flutter_elisoft/theme.dart';
import 'package:flutter_elisoft/ui/screens/home_screen.dart';

import '../widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/auth';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          context.read<AuthCubit>().whenError();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.5,
              left: 20,
              right: 20,
            ),
            content: Row(
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  state.failure.message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xffB22727),
            duration: const Duration(seconds: 1),
          ));
        } else if (state is AuthSuccess) {
          Future.delayed(const Duration(seconds: 0)).then((_) {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          }).then((_) =>
              BlocProvider.of<ArticleFetchCubit>(context, listen: false)
                  .fetchArticle());
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                  body: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Container(
                      height: 385,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/login_image.png'),
                        ),
                      ),
                      child: Text(
                        'My Apps',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: styleColor(1),
                        ),
                      ),
                    ),
                    customTextFormField(
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        title: 'Username'),
                    const SizedBox(
                      height: 13,
                    ),
                    customTextFormField(
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      title: 'Password',
                      isPassword: true,
                      obsecureText: !showPassword,
                      onpress: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    customButton(
                      text: 'LOGIN',
                      onpress: () {
                        context.read<AuthCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      },
                    ),
                  ],
                ),
              )),
              if (state is AuthLoading)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      backgroundColor: Color.fromRGBO(46, 56, 57, 1),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
