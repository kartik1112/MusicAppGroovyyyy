import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_assignment/Screens/AuthScreen/bloc/auth_bloc.dart';
import 'package:music_app_assignment/widgets/CustomButton.dart';
import 'package:music_app_assignment/widgets/CustomTextFieldWidget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSchemeTheme = Theme.of(context).colorScheme;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final Widget switch2 = Text("data");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return (state is AuthInitial)?const SizedBox():IconButton(
                color: colorSchemeTheme.primary,
                onPressed: () {
                  passwordController.clear();
                  emailController.clear();
                  context.read<AuthBloc>().emit(AuthInitial());
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: colorSchemeTheme.primaryContainer,
                ));
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "No Account? Sign Up",
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorSchemeTheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "lib/assets/bg_animation.jpg",
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(0.5),
                  radius: 100,
                ),
              ),
              ClipRect(
                child: BackdropFilter(
                  // blendMode: BlendMode.hardLight,
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: colorSchemeTheme.primary, width: 2),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.amber.withOpacity(0.2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Groove Into Music...",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 42,
                                    // color: colorSchemeTheme.primaryContainer,
                                    color: colorSchemeTheme.primaryContainer,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                switch (state) {
                                  case AuthInitial():
                                    return CustomTextFieldWidget(
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Email",
                                      controller: emailController,
                                    );
                                  case AuthLoading():
                                    return CustomTextFieldWidget(
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Password",
                                      controller: emailController,
                                    );
                                  case AuthSuccess():
                                    return CustomTextFieldWidget(
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Password",
                                      controller: passwordController,
                                    );

                                  default:
                                    return CustomTextFieldWidget(
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Email",
                                      controller: emailController,
                                    );
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlocBuilder<AuthBloc, AuthState>(
                              // bloc: AuthBloc(),
                              builder: (context, state) {
                                switch (state) {
                                  case AuthInitial():
                                    return CustomButtonWidget(
                                      onPressed: () {
                                        context.read<AuthBloc>().add(
                                            OnClickEmailContinueButton(
                                                isEmailFilled: (emailController
                                                    .text.isNotEmpty)));
                                      },
                                      isLoading: false,
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Continue",
                                      icon: Icons.login,
                                    );
                                  case AuthSuccess():
                                    return CustomButtonWidget(
                                      onPressed: () {},
                                      isLoading: false,
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Login",
                                      icon: Icons.login,
                                    );
                                  case AuthLoading():
                                    return CustomButtonWidget(
                                      isLoading: true,
                                      colorSchemeTheme: colorSchemeTheme,
                                    );
                                  default:
                                    return CustomButtonWidget(
                                      isLoading: false,
                                      colorSchemeTheme: colorSchemeTheme,
                                      text: "Continue",
                                      icon: Icons.login,
                                    );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
