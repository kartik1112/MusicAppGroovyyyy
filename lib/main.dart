import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_assignment/Screens/AuthScreen/bloc/auth_bloc.dart';
import 'package:music_app_assignment/Screens/AuthScreen/ui/AuthScreen.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:music_app_assignment/Screens/LoginScreen/ui/loginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
            textTheme: GoogleFonts.dmSansTextTheme(),
            scaffoldBackgroundColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: const AuthScreen(),
      ),
    ),
  );
}
